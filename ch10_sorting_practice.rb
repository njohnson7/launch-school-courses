# ch10_sorting_practice.rb



def sort(unsorted, sorted)
  array2 = unsorted
  unsorted.each do |word|
    counter = 0
    array2.each do |word2|
      if word <= word2
        counter += 1
        if counter == unsorted.length
          sorted << word
          unsorted.delete_at(unsorted.index(word) || unsorted.length)  # || unsorted.length to avoid giving a TypeError
                                                                       # this way it will only delete a single element, in case
                                                                       #  of duplicates
        end
      end
    end
  end
end

unsorted = ['tom','bob','fred', 'carl', 'alfred', 'fred', 'ned', 'eric', 'tom', 'joe']
sorted = []

p sorted
p unsorted
puts

10.times { sort(unsorted, sorted) }

p sorted
p unsorted
puts