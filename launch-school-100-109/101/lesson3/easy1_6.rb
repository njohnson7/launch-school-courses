# easy1_6.rb

famous_words = "seven years ago..."
famous_words.prepend("Four score and ")
puts famous_words

famous_words = "seven years ago..."
famous_words = "Four score and " + famous_words
puts famous_words

famous_words = "seven years ago..."
famous_words = "Four score and " << famous_words
puts famous_words

famous_words = "seven years ago..."
famous_words.insert(0, "Four score and ")
puts famous_words

famous_words = "seven years ago..."
(famous_words.reverse! << 'Four score and '.reverse).reverse!
puts famous_words

famous_words = "seven years ago..."
famous_words.sub!('s', 'Four score and s')
puts famous_words

famous_words = "seven years ago..."
famous_words = famous_words.split.unshift("Four score and").join(" ")
puts famous_words

famous_words = "seven years ago..."
famous_words = famous_words.chars.unshift("Four score and ".chars).join
puts famous_words
