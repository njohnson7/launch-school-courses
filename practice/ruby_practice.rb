

'Blue Whale'.index('Blue')   # => 0
'Blue Whale'.index('Blute')  # => nil
'Blue Whale'.index('Whale')  # => 5
'canal'.rindex('a')          # => 3
'canal'.rindex('x')          # => nil
'Blue Whale'.index('e', 4)   # => 9
'canal'.rindex('a', 2)       # => 1
'canal'.rindex('a', 0)       # => nil

