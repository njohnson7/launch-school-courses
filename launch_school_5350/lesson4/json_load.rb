require 'json'
require_relative 'json.rb'

obj = JSON.load File.read('ada.json')
p obj
puts obj.full_name
