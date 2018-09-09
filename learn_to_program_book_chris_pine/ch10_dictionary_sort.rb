# ch10_dictionary_sort.rb



def dictionary_sort(array, sorted = [])
  array2 = array
  array.each do |word|
    counter = 0
    array2.each do |word2|
      if word.downcase <= word2.downcase
        counter += 1
        if counter == array.length
          sorted << word
          array.delete_at(array.index(word) || array.length)
        end
      end
    end
  end
  dictionary_sort(array, sorted) unless array.empty?
  sorted
end

words = ["desk", "chair", "lamp", "table", "window", "Dell", "Logitech", "Alienware", "furnace", "Asus", "Acer",
         "chair", "book", "MSI", "lamp", "Nvidia", "carpet", "door", "lamp", "dresser", "Lamp", "HTC"]

p dictionary_sort(words)