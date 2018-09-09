require 'json'

class Address
  def to_json(options = {})
    { street: "3140 W. Belmont St.", city: "Chicago", state: "IL" }.to_json
  end
end

address = Address.new
puts JSON.generate(address)
