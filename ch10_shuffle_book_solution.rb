# ch10_shuffle_book_solution.rb



def shuffle(arr)
  shuf = []

  while arr.length > 0
    rand_index = rand(arr.length)
    curr_index = 0
    new_arr = []
    arr.each do |item|
      if curr_index == rand_index
        shuf.push(item)
      else
        new_arr.push(item)
      end
      curr_index += 1
    end

    arr = new_arr
  end
  shuf
end

array = (1..20).to_a

p shuffle(array)



# BOOK SOLUTION 2:

def shuffle2(arr)
  arr.sort_by {rand}
end

array = (1..20).to_a

p shuffle2(array)