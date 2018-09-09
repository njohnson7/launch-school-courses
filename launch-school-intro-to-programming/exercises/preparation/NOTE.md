# Notes on Preparation Exercises

# I placed copies of the two Ruby files I created in exercise 1 in the ~/intro/preparation_exercises/my_folder_copy directory, so that they can serve as a reference after I delete the originals.

# Below is a copy of the commands I entered in terminal to complete the exercises:

one@two ~/intro/practice $ ls
example.rb  preparation.rb
one@two ~/intro/practice $ cd ..
one@two ~/intro $ mkdir preparation_exercises
one@two ~/intro $ cd preparation_exercises/
one@two ~/intro/preparation_exercises $ mkdir my_folder
one@two ~/intro/preparation_exercises $ cd my_folder
one@two ~/intro/preparation_exercises/my_folder $ touch one.rb two.rb
one@two ~/intro/preparation_exercises/my_folder $ ls
one.rb  two.rb
one@two ~/intro/preparation_exercises/my_folder $ ruby one.rb
this is file one
one@two ~/intro/preparation_exercises/my_folder $ ruby two.rb
this is file two
one@two ~/intro/preparation_exercises/my_folder $ mkdir copies
one@two ~/intro/preparation_exercises/my_folder $ cp one.rb two.rb copies
one@two ~/intro/preparation_exercises/my_folder $ ls copies
one.rb  two.rb
one@two ~/intro/preparation_exercises/my_folder $ echo "# I placed copies of the two Ruby files I created in exercise 1 in this folder, so that they can serve as a reference after I delete the originals." >> copies/NOTE.md
one@two ~/intro/preparation_exercises/my_folder $ cat copies/NOTE.md 
# I placed copies of the two Ruby files I created in exercise 1 in this folder, so that they can serve as a reference after I delete the originals.
one@two ~/intro/preparation_exercises/my_folder $ ls copies
NOTE.md  one.rb  two.rb
one@two ~/intro/preparation_exercises/my_folder $ cat copies/*
# I placed copies of the two Ruby files I created in exercise 1 in this folder, so that they can serve as a reference after I delete the originals.
# one.rb

puts 'this is file one'# two.rb

puts 'this is file two'one@two ~/intro/preparation_exercises/my_folder $ 
one@two ~/intro/preparation_exercises/my_folder $ ls
copies  one.rb  two.rb
one@two ~/intro/preparation_exercises/my_folder $ cd ..
one@two ~/intro/preparation_exercises $ ls
my_folder
one@two ~/intro/preparation_exercises $ cp -r my_folder my_folder_copy
one@two ~/intro/preparation_exercises $ cd my_folder_copy/
one@two ~/intro/preparation_exercises/my_folder_copy $ ls
copies  one.rb  two.rb
one@two ~/intro/preparation_exercises/my_folder_copy $ cd copies
one@two ~/intro/preparation_exercises/my_folder_copy/copies $ mv * ..
one@two ~/intro/preparation_exercises/my_folder_copy/copies $ ls
one@two ~/intro/preparation_exercises/my_folder_copy/copies $ cd ..
one@two ~/intro/preparation_exercises/my_folder_copy $ ls
copies  NOTE.md  one.rb  two.rb
one@two ~/intro/preparation_exercises/my_folder_copy $ ls
copies  NOTE.md  one.rb  two.rb
one@two ~/intro/preparation_exercises/my_folder_copy $ rmdir copies
one@two ~/intro/preparation_exercises/my_folder_copy $ ls
NOTE.md  one.rb  two.rb
one@two ~/intro/preparation_exercises/my_folder_copy $ cd ..
one@two ~/intro/preparation_exercises $ ls
my_folder  my_folder_copy
one@two ~/intro/preparation_exercises $ rm -rv my_folder
removed ‘my_folder/two.rb’
removed ‘my_folder/one.rb’
removed ‘my_folder/copies/two.rb’
removed ‘my_folder/copies/one.rb’
removed ‘my_folder/copies/NOTE.md’
removed directory: ‘my_folder/copies’
removed directory: ‘my_folder’
one@two ~/intro/preparation_exercises $ ls *
NOTE.md  one.rb  two.rb
one@two ~/intro/preparation_exercises $ cat my_folder_copy/*
# I placed copies of the two Ruby files I created in exercise 1 in this folder, so that they can serve as a reference after I delete the originals.
# one.rb

puts 'this is file one'# two.rb

puts 'this is file two'one@two ~/intro/preparation_exercises $ 
one@two ~/intro/preparation_exercises $ 
