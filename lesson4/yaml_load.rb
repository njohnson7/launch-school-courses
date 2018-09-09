require 'psych'
require_relative 'yaml'

obj = Psych.load File.read('ada.yaml')
p obj
puts obj.full_name
