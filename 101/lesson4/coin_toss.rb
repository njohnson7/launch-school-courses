# coin_toss.rb

def heads_or_tails
  prompt "Let's flip a coin to decide who goes first!"
  prompt "Type 'h' for heads or 't' for tails:"

  coin_side = ''
  loop do
    coin_side = gets.chomp.downcase
    break if %w(h t).include?(coin_side)
    prompt "Invalid choice. Please choose: #{joinor(%w(h t))}"
  end
  clear_screen

  coin_side
end

def coin_toss_user_win?(coin_side)
  %w(h t).sample == coin_side
end

def display_coin_toss_result(winner)
  if winner == 'u'
    prompt 'You won the coin toss!'
  else
    prompt 'The computer has won the coin toss!'
  end
end

def coin_toss_winner
  coin_side = heads_or_tails
  winner = coin_toss_user_win?(coin_side) ? 'u' : 'c'
  display_coin_toss_result(winner)

  winner
end
