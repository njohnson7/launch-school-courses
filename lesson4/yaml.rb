require 'psych'

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

File.open('ada.yaml', 'w') do |f|
  f.write Psych.dump(ada_lovelace)
end

