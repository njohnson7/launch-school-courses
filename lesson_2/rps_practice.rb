# frozen_string_literal: true

# rps_practice.rb


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

CHOICES = %i[rock paper scissors].freeze
WINNING_CONDITIONS = { rock:     :scissors,
                       paper:    :rock,
                       scissors: :paper }.freeze

def prompt(msg)
  puts ">> #{msg}"
end

class Player
  attr_reader :hand

  def initialize
    @hand = nil
  end

  def compare_hand(other)
    return :tie if hand == other.hand
    WINNING_CONDITIONS.each do |hand1, hand2|
      if hand == hand1 && other.hand == hand2
        return :win
      elsif hand == hand2 && other.hand == hand1
        return :lose
      end
    end
  end

  def display_winner(other)
    result = compare_hand(other)
    puts case result
         when :tie then 'You have tied.'
         when :win then "#{self.class} has won!"
         when :lose then "#{self.class} has lost!"
         end
  end
end

class User < Player
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

user = User.new
user.make_choice
p user.hand

computer = Computer.new
computer.make_choice
p computer.hand

user.display_winner(computer)