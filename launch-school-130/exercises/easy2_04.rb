# easy2_04.rb

def count(*args)
  args.select { |arg| yield(arg) }.size
end

# recursive:
def count(*args, &block)
  return 0 if args.empty?
  count(*args.drop(1), &block) + (block.call(args.first) ? 1 : 0)
end


p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3
