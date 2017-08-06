

a = [4, 5, 6]
b = [1, 2, 3]
a.send(:insert, *[0, *b])
a  # => [1, 2, 3, 4, 5, 6]

# or - more literally:
a = [4, 5, 6]                    # => [4, 5, 6]
a.send(:insert, *[0].concat(b))  # => [1, 2, 3, 4, 5, 6]
a  # => [1, 2, 3, 4, 5, 6]


