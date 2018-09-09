# select_method_practice.rb

def select(arr)
  return arr.to_enum unless block_given?
  selected = []
  idx = 0
  until idx == arr.size
    selected << arr[idx] if yield(arr[idx])
    idx += 1
  end
  selected
end

p select([1, 2, 3, 4, 5]) { |n| n.even? }
p select([1, 2, 3, 4, 5]) { |n| n.odd? }
p select([1, 2, 3, 4, 5]) { true }
p select([1, 2, 3, 4, 5]) { false }
p select(%w[1 2 three four 5 six]) { |str| str[/\d/] }
p select([]) { |a| a == 1 }
p select([])
p select([1, 2, 3])
p select([1, 2, 3]) { |n| puts n }
p select([1, 2, 3, 4, 5]) { |n| n + 1 }
puts

arr = [1, 2, 3, 4, 5]

select(arr) { |num| num.odd? } #=> [1, 3, 5]
select(arr) { |num| puts num } #=> [], because "puts num" returns nil and evaluates to false
select(arr) { |num| num + 1 }  #=> [1, 2, 3, 4, 5], because "num + 1" evaluates to true
