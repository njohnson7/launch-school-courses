# exercise17.rb
# What will the following program output?



hash1 = { shoes: "nike", "hat" => "adidas", :hoodie => true }
hash2 = { "hat" => "adidas", :shoes => "nike", hoodie: true }

if hash1 == hash2
  puts "These hashes are the same!"
else
  puts "These hashes are not the same!"
end


# The program will output "These hashes are the same!" because the order of hashes is not important, it's only the contents that matter.
# Even though the syntax and order used when creating the 2 hash variables are different, the content is the same, so both of these hashes are
#  equivalent to each other.


# Test showing that these 2 hashes have different index values for their particular key-value pairs:
hash1.each_with_index { |(k, v), idx| puts "key: #{k}  /  value: #{v}  /  index: #{idx}" }
puts "--------------------------------"
hash2.each_with_index { |(k, v), idx| puts "key: #{k}  /  value: #{v}  /  index: #{idx}" }
# Even though the indices are different, the hashes are still considered equivalent to each other.
# The index refers to the index of each iteration, not the index of the hash, I think...



# VIDEO NOTES:
# In Hashes, order is not important from a logical programming standpoint b/c we retrieve values based on their keys.
# In Arrays, order is very important.