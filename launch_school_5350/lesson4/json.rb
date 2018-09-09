require 'json'

class Person
  def initialize(first_name, middle_name, last_name)
    @first_name  = first_name
    @middle_name = middle_name
    @last_name   = last_name
  end
  def full_name
    [@first_name, @middle_name, @last_name].join(" ")
  end
end

ada_lovelace = Person.new("Augusta", "Ada", "King")

File.open('ada.json', 'w') do |f|
  f.write JSON.dump(ada_lovelace)
end

