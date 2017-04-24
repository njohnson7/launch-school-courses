# OBJECT ORIENTED PROGRAMMING

=begin



- OOP definition:
  - an approach to programming that solves problems by modeling programs based on objects that exist in the real world.

----------------------
- It was created to solve the problem of large and complex programs being extremely difficult to modify and maintain.
  - Small changes in one place would trigger a ripple effect of errors due to dependencies throughout the entire program
- Programmers needed a way to create containers for data that could be changed and manipulated without affecting the entire program.
- They needed a way to section off areas of code that performed certain procedures, so that their programs could become the interaction of many small parts, instead of one massive blob of dependency.
-------------------------------
=end

# - use term: 'MODULAR'!
# -maybe explain procedural first?


=begin
- Pros:
    - Creating and interacting with objects that are modeled after the real world allows us to raise our level of abstraction when we are programming, so that we can think more in human terms than in computer terms. This helps us to focus more on solving the overall problem on a higher level, without getting bogged down by low-level implementation details.

    - Because objects represent nouns, and the messages that these objects send and receive represent verbs (or the behavior of these nouns), the language of OOP more naturally translates to the language we use in our daily lives, so it is much easier to conceptualize and design a program.

    - OOP gives us a modular structure for our programs, where we can use modules, classes, and methods to encapsulate states and behavior. This allows us to selectively expose functionality to only the parts of our code that need it, which lowers the chance of any namespace collision issues, and helps to protect data from accidental modifications.

    - By using inheritance and polymorphism, we are able to re-use functionality in multiple places without duplication. By writing less code, we can decrease the probability of errors, and make our programs less convoluted.

    - We can include pre-written code, such as gems, in our programs, which allows us to build programs more quickly and efficiently, because we can avoid re-implementing functionality that already exists.

    - Well designed OOP code is flexible, effectively uses encapsulation, and has loosely coupled dependencies. This allows us to easily modify even long and complex programs, without the problem of a change in one place affecting the entire codebase. This also makes our code easier to debug.

- Cons:
    - The flexibility of OOP also contributes to more indrection, because if you have classes that are loosely coupled and only have one responsibility, and methods that only do one thing, then the total number of classes and methods will be much higher. This can make code harder to understand, because you will have to jump between many classes and methods in order to follow the sequential logic of a program.

    - OOP code can be longer and more complex than procedural code, especially in problems that may be more easily solved using procedural programming, such as small programs and programs that always follow a specific sequence of events, like scripts.

    - Because OOP focuses so much on objects as nouns, sometimes other important aspects of a program, such as messages and methods, get pushed to the sidelines. This can contribute to an overall design that is out of balance, and may not accurately represent the real world.

    - Poorly designed OOP code can have many tightly coupled dependencies and long and convoluted inheritance hierarchies, making the dependency graph look like a spider web. This makes the code harder to re-use and not very modular, which negates many of the advantages of using OOP.

    - OOP code can often be slower and more resource heavy than non-OOP code.
    It can take longer to plan out and write OOP code, although once written, it will usually take less time to modify.

=end








[1, 2, 3].zip([4, 5, 6], [7, 8, 9])  # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
[1, 2, 3].zip([4, 5, 6])             # => [[1, 4], [2, 5], [3, 6]]
         .zip([7, 8, 9])             # => [[[1, 4], 7], [[2, 5], 8], [[3, 6], 9]]
         .flatten                    # => [1, 4, 7, 2, 5, 8, 3, 6, 9]


matrix = [[1, 2, 3, 4]]      # => [[1, 2, 3, 4]]
matrix.drop(1)               # => []
matrix.first                 # => [1, 2, 3, 4]
      .zip(*matrix.drop(1))  # => [[1], [2], [3], [4]]

[1, 2, 3, 4].zip([])               # => [[1, nil], [2, nil], [3, nil], [4, nil]]
[1, 2, 3, 4].zip(*[])              # => [[1], [2], [3], [4]]

[1, 2, 3, 4].zip([])  { |x| p x }  # => nil
# ->> [1, nil]
# ->> [2, nil]
# ->> [3, nil]
# ->> [4, nil]
[1, 2, 3, 4].zip(*[]) { |x| p x }  # => nil
# ->> [1]
# ->> [2]
# ->> [3]
# ->> [4]

a = *[]   # => []
a = *nil  # => []


matrix = [[1], [2], [3], [4]]  # => [[1], [2], [3], [4]]
matrix.drop(1)                 # => [[2], [3], [4]]
matrix.first                   # => [1]
      .zip(*matrix.drop(1))    # => [[1, 2, 3, 4]]

[1].zip([[2], [3], [4]])   # => [[1, [2]]]
[1].zip(*[[2], [3], [4]])  # => [[1, 2, 3, 4]]


matrix = [[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]  # => [[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]
matrix.drop(1)                                                # => [[4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]
matrix.first                                                  # => [1, 2, 3, 4, 5]
      .zip(*matrix.drop(1))                                   # => [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]

[1, 2, 3, 4, 5].zip([[4, 3, 2, 1, 0], [3, 7, 8, 6, 2]])   # => [[1, [4, 3, 2, 1, 0]], [2, [3, 7, 8, 6, 2]], [3, nil], [4, nil], [5, nil]]
[1, 2, 3, 4, 5].zip(*[[4, 3, 2, 1, 0], [3, 7, 8, 6, 2]])  # => [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]


matrix = [[1]]               # => [[1]]
matrix.drop(1)               # => []
matrix.first                 # => [1]
      .zip(*matrix.drop(1))  # => [[1]]

[1].zip([])   # => [[1, nil]]
[1].zip(*[])  # => [[1]]

# >> [1, nil]
# >> [2, nil]
# >> [3, nil]
# >> [4, nil]
# >> [1]
# >> [2]
# >> [3]
# >> [4]


