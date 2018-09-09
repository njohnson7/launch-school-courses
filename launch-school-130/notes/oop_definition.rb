# OBJECT ORIENTED PROGRAMMING

=begin

- OOP DEFINITION:
  - a modular approach to programming that solves problems by modeling programs based on objects that exist in the real world.
- PROCEDURAL:
  - top-down approach
  - large and complex programs difficult to maintain
  - one massive blob of dependency => ripple effects of change
- OOP:
  - interaction of many small parts
    - section off areas of code for certain procedures
  - modular approach to programming
    - create containers for data that can be changed w/o ripple effects
  - abstraction:
    - simplify complex reality by modeling classes apprpriate to the probelm
  - encapsulation:
   - creating classes/objects and exposing interfaces to interact w/ them
   - hide implementation details
   - contain ripple effects of change
  - polymorphism
  - inheritance
- PROS:
  - higher level of abstraction
    - easier to manage complex programs
  - easier to conceptualize objects as nouns and methods as verbs
  - expose functionality to parts of code that need it
    - namespace issues less common
    - prevents accidental modifications
  - easier/faster to modify
    - b/c changes are encapsulated to a class/obj
      - public interface can stay the same even if implementation changes
  - give functionality to different parts of app w/o duplication
    - polymorphism, inheritance
  - build apps faster by using pre-written code
    - polymorphism, inheritance
  - flexible and loosely coupled dependencies
  - easier to debug
  - collaborator objects:
    - model a complex problem domain by splitting up into cohesive pieces
- CONS:
  - more indirection
    - harder to understand
  - longer and more complex
  - imbalance from focusing too much on nouns/objects
    - time/sequence and methods
  - can still have lots of dependencies if done wrong
  - slower, more resources
  - longer to plan/design and write
------------------

=end

=begin
  - more indrection allows us to encapsulate changes to a class/object so that they don't affect the entire codebase
    - the interface methods to collaborate w/ a class or object can remain the same while the implementation changes

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

    -It can take longer to plan out and write OOP code, although once written, it will usually take less time to modify.

=end
