# medium3_5.rb
# How could the unnecessary duplication in this method be removed?

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

# solution 1:
def color_valid(color)
  color == 'blue' || color == 'green'
end

# solution 2:
def color_valid(color)
  case color
  when 'blue', 'green' then true
  end
end
