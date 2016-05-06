# ch10_sorting_book_solution.rb



def sort(arr)
  rec_sort(arr, [])
end

def rec_sort(unsorted, sorted)
  return sorted if unsorted.length <= 0

  smallest = unsorted.pop
  still_unsorted = []

  unsorted.each do |tested_obj|
    if tested_obj < smallest
      still_unsorted.push smallest
      smallest = tested_obj
    else
      still_unsorted.push tested_obj
    end
  end
  sorted.push smallest
  rec_sort(still_unsorted, sorted)
end

array = ['tom','bob','fred', 'carl', 'alfred', 'fred', 'ned', 'eric', 'tom', 'joe', 'larry', 'todd', 'jeremy']

p sort(array)



# SOLUTION 2:

def sort2(arr)
  return arr if arr.length <= 1

  middle = arr.pop
  less = arr.select { |x| x < middle }
  more = arr.select { |x| x >= middle }

  sort2(less) + [middle] + sort2(more)
end

array = ['tom','bob','fred', 'carl', 'alfred', 'fred', 'ned', 'eric', 'tom', 'joe', 'larry', 'todd', 'jeremy']

p sort(array)