require_relative 'marshal'

obj = Marshal.load File.read('ada.marshal')
p obj
puts obj.full_name
