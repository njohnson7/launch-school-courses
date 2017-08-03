
def repeatedCharacters(str)
  str.downcase.chars
  .uniq
  .map { |c| [c.to_sym, str.downcase.count(c)] }
  .reject { |k, v| v < 2 }.to_h
end

p repeatedCharacters('Programming')    ==
  { r: 2, g: 2, m: 2 }
p repeatedCharacters('Combination')    ==
  { o: 2, i: 2, n: 2 }
p repeatedCharacters('Pet')            ==
  {}
p repeatedCharacters('Paper')          ==
  { p: 2 }
p repeatedCharacters('Baseless')       ==
  { s: 3, e: 2 }
