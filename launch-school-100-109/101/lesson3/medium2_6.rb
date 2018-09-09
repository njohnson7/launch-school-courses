# medium2_6.rb

# One day Spot was playing with the Munster family's home computer and he wrote
# a small program to mess with their demographic data:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# After writing this method, he typed the following...and before Grandpa could
# stop him, he hit the Enter key with his tail:

mess_with_demographics(munsters)

# Did the family's data get ransacked, or did the mischief only mangle a local
# copy of the original hash? (why?)


# The data got permanently modified, because the mess_with_demographics method
# did not reassign the munsters hash that got passed into it to a different
# location in memory. Instead, it just modified the value stored in the location
# in memory that the munsters hash was pointing to, so the munsters hash is
# permanently modified. If the method were to just say for instance, demo_hash =
# {}, then the munsters hash would be unmodified.
