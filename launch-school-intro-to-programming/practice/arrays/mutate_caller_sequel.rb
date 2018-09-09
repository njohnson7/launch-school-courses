# mutate_caller_sequel.rb



def mutate(arr)
  arr.pop
end

def not_mutate(arr)
  arr.select { |i| i > 3 }
end

a = [1, 2, 3, 4, 5, 6]
mutate(a)       # Performs destructive action (pop) on its argument, permanently modifying a array, even though a was initialized
                #  outside of mutate's scope. Popped element 6 out of original array.
not_mutate(a)       # Performs non-destructive action (select) so original array was left unmodified

puts a        # @> 1, 2, 3, 4, 5