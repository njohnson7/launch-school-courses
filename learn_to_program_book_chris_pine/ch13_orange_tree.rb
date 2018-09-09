# ch13_orange_tree.rb



class OrangeTree
  def initialize
    @age = 0
    @height = 0
    @oranges = 0
    puts "You have planted an orange tree!"
  end

  def height
    puts "Your tree is #{@height} feet tall."
  end

  def one_year_passes
    puts "A year passes."
    @age += 1
    if @age > 10
      puts "Your tree has died at age 10."
      exit
    end
    @height += 3
    produce_oranges
  end

  def count_the_oranges
    puts "Your tree currently has #{@oranges} oranges."
  end

  def pick_an_orange
    if @oranges <= 0
      puts "Your tree has no more oranges left to pick this year."
    else
      @oranges -= 1
      puts "Mmmmm! That was a delicious orange!"
    end
  end

  private
  def produce_oranges
    if @age >= 3
      @oranges = (@age - 2) * 10
    end
  end
end

tree = OrangeTree.new
tree.height
tree.count_the_oranges
tree.pick_an_orange
tree.one_year_passes
tree.height
tree.count_the_oranges
tree.one_year_passes
tree.one_year_passes
tree.height
tree.count_the_oranges
tree.one_year_passes
tree.one_year_passes
tree.pick_an_orange
tree.count_the_oranges
31.times { tree.pick_an_orange }
tree.count_the_oranges
tree.height
tree.one_year_passes
tree.count_the_oranges
tree.pick_an_orange
tree.count_the_oranges
tree.one_year_passes
tree.one_year_passes
tree.one_year_passes
tree.one_year_passes
tree.pick_an_orange
tree.height
tree.count_the_oranges
tree.one_year_passes
tree.one_year_passes