# rps_practice2.rb
# frozen_string_literal: true


# user makes a choice: rock/paper/scissors
# computer makes a choice: rock/paper/scissors
# determine who wins
  # rules:
    # paper > rock
    # rock > scissors
    # scissors > paper
    # if computer and user choose same move, then tie
# display winner

# nouns: rock, paper, scissors, user, computer, (rules?)
# verbs: choose, determine winner, display winner

module General
  def prompt(msg)
    puts ">> #{msg}"
  end
end

class Player
  include General

  CHOICES = %i[rock paper scissors].freeze

  attr_accessor :name, :hand

  def initialize(n)
    @name = n
  end

  def display_hand
    puts " - #{self.class}'s hand: #{' ' * (9 - self.class.to_s.size)}#{hand}"
  end
end

class Human < Player
  def make_choice
    loop do
      prompt "Please choose: (r)ock, (p)aper, (s)cissors"
      choice = gets.chomp
      if valid_choice?(choice)
        @hand = CHOICES.find { |c| c.to_s.start_with?(choice[0].downcase) }
        break
      end
      prompt 'Invalid choice'
    end
  end

  private

  def valid_choice?(choice)
    !!(choice =~ /\A(r(ock)?|p(aper)?|s(cissors)?)\z/i)
  end
end

class Computer < Player
  def make_choice
    @hand = CHOICES.sample
  end
end

class RPSGame
  include General

  WINNING_CONDITIONS = { rock:     :scissors,
                         paper:    :rock,
                         scissors: :paper }.freeze

  attr_accessor :human, :computer

  def initialize
    @human = Human.new('You')
    @computer = Computer.new('Computer')
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def display_winner
    result = compare_hands
    puts case result
         when :tie  then "#{human.name} have tied."
         when :win  then "#{human.name} have won!"
         when :lose then "#{human.name} have lost!"
         end
  end

  def compare_hands
    return :tie if human.hand == computer.hand
    WINNING_CONDITIONS.each do |hand1, hand2|
      if human.hand == hand1 && computer.hand == hand2
        return :win
      elsif human.hand == hand2 && computer.hand == hand1
        return :lose
      end
    end
  end

  def play_again?
    puts "\n\n=========================================="
    prompt "Press any key to play again or 'q' to quit."
    choice = gets.chomp.downcase
    puts "\n\n"
    choice != 'q'
  end

  def play
    clear_screen
    display_welcome_msg

    round_num = 1
    loop do
      puts "\n\nROUND #{round_num}!"
      puts "___________________\n\n"
      human.make_choice
      human.display_hand

      computer.make_choice
      computer.display_hand

      display_winner

      break unless play_again?
      round_num += 1
    end

    display_goodbye_msg
  end
end

RPSGame.new.play
