# video_ex3.rb
# write a method that combines 2 arrays passed in as arguments, and returns a
#  new ary that contains all elems from both ary args, w/ the elems taken in
#  alternation.

# assume that both input arrays are non-empty, and that they have the same num
#  of elems.

def interleave(ary1, ary2)
  combo_ary = []
  ary1.length.times do |idx|
    combo_ary << ary1[idx]
    combo_ary << ary2[idx]
  end
  combo_ary
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
p interleave([1, 2, 3], ['a', 'b', 'c'])
