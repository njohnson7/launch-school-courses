# easy9_01_welcome_stranger.rb
# Welcome Stranger

# Create a method that takes 2 arguments, an array and a hash. The array will
# contain 2 or more elements that, when combined with adjoining spaces, will
# produce a person's name. The hash will contain two keys, :title and
# :occupation, and the appropriate values. Your method should then display a
# greeting that uses the person's full name, and mentions the persons title.

def greetings(name, job)
  puts "Hello, #{name.join(' ')}! Nice to have" \
       " #{job.fetch(:title)[0] =~ /[aeiou]/i ? 'an' : 'a'}" \
       " #{job.values.join(' ')} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.
greetings(%w(Bob Lob Law), { title: 'Extreme', occupation: 'Killer' })
