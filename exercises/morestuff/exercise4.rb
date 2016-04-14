# exercise4.rb
# Modify the code in exercise 2 to make the block execute properly.



def execute(&block)
  block.call                # used the call method on block so that the block will be activated and the program will execute it
end

execute { puts "Hello from inside the execute method!" }