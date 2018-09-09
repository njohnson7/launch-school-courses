# easy1_06.rb


# Fix the Program - Flight Data

# Consider the following class definition:

class Flight
  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end

  private

  attr_accessor :database_handle
end

# There is nothing technically incorrect about this class, but the definition
# may lead to problems in the future. How can this class be fixed to be
# resistant to future problems?
