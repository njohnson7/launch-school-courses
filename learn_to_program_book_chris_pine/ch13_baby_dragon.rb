# ch13_baby_dragon.rb



class Dragon
  def initialize(name)
    @name = name
    @asleep = false
    @stuff_in_belly = 10        # he's full
    @stuff_in_intestine = 0         # he doesn't need to go
    puts "#{@name} is born."
  end

  def feed
    puts "You feed #{@name}."
    @stuff_in_belly = 10
    passage_of_time
  end

  def walk
    puts "You walk #{@name}."
    @stuff_in_intestine = 0
    passage_of_time
  end

  def put_to_bed
    puts "You put #{@name} to bed."
    @asleep = true
    3.times do
      if @asleep
        passage_of_time
      end
      if @asleep
        puts "#{@name} snores, filling the room with smoke."
      end
    end
    if @asleep
      @asleep = false
      puts "#{@name} wakes up slowly"
    end
  end

  def toss
    puts "You toss #{@name} up into the air."
    puts "He giggles, which singes your eyebrows."
    passage_of_time
  end

  def rock
    puts "You rock #{@name} gently."
    @asleep = true
    puts "He briefly dozes off..."
    passage_of_time
    if @asleep
      @asleep = false
      puts "...but wakes when you stop."
    end
  end

  private       # private means that the methods defined here are method internal to the obj.
                # u can feed ur dragon, but u can't ask him whether he's hungry
  def hungry?
    @stuff_in_belly <= 2
  end

  def poopy?
    @stuff_in_intestine >= 8
  end

  def passage_of_time
    if @stuff_in_belly > 0        # move food from belly to intestine:
      @stuff_in_belly -= 1
      @stuff_in_intestine += 1
    else        # our dragon is starving!
      if @asleep
        @asleep = false
        puts "He wakes up suddenly!"
      end
      puts "#{@name} is starving! In desperation, he ate YOU!"
      exit        # this quits the program
    end

    if @stuff_in_intestine >= 10
      @stuff_in_intestine = 0
      puts "Whoops! #{@name} had an accident..."
    end

    if hungry?
      if @asleep
        @asleep = false
        puts "He wakes up suddenly!"
      end
      puts "#{@name}'s stomach grumbles..."
    end

    if poopy?
      if @asleep
        @asleep = false
        puts "He wakes up suddenly!"
      end
      puts "#{@name} does the potty dance..."
    end
  end
end

puts "What would you like to call your new baby dragon?"
name = gets.chomp
dragon = Dragon.new(name)

while true
  puts "\nWhat would you like to do with #{name}?"
  puts "You can 'feed' #{name}, 'walk' #{name}, 'rock' #{name}, 'toss' #{name}, or put #{name} to 'bed'."
  puts "Type 'quit' to quit."
  choice = gets.chomp.downcase
  puts
  case choice
  when 'feed'
    dragon.feed
  when 'walk'
    dragon.walk
  when 'rock'
    dragon.rock
  when 'toss'
    dragon.toss
  when 'bed'
    dragon.put_to_bed
  when 'quit'
    puts "Goodbye!"
    break
  else
    puts "Sorry, I didn't quite catch that."
  end
end