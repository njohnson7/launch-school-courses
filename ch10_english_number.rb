# ch10_english_number.rb




def english_num(num)
  if num < 0
    return "You must enter a positive number."
  elsif num > 100
    return "You must enter a number below 100."
  elsif num == 0
    english = "zero"
  elsif num == 10
    english = "ten"
  elsif num == 11
    english = "eleven"
  elsif num == 12
    english = "twelve"
  elsif num == 13
    english = "thirteen"
  elsif num == 14
    english = "fourteen"
  elsif num == 15
    english = "fifteen"
  elsif num == 16
    english = "sixteen"
  elsif num == 17
    english = "seventeen"
  elsif num == 18
    english = "eighteen"
  elsif num == 19
    english = "nineteen"
  elsif num == 100
    english = "one-hundred"
  else
    english = ""
    tens = num / 10
    ones = num % 10
    if tens == 2
      english << "twenty"
    elsif tens == 3
      english << "thirty"
    elsif tens == 4
      english << "forty"
    elsif tens == 5
      english << "fifty"
    elsif tens == 6
      english << "sixty"
    elsif tens == 7
      english << "seventy"
    elsif tens == 8
      english << "eighty"
    elsif tens == 9
      english << "ninety"
    else
    end

    if ones == 1
      english << "-one"
    elsif ones == 2
      english << "-two"
    elsif ones == 3
      english << "-three"
    elsif ones == 4
      english << "-four"
    elsif ones == 5
      english << "-five"
    elsif ones == 6
      english << "-six"
    elsif ones == 7
      english << "-seven"
    elsif ones == 8
      english << "-eight"
    elsif ones == 9
      english << "-nine"
    else
    end
  end
  if english[0] == "-"
    english.delete!("-")
  end
  "You entered the number #{english}."
end

print "Please enter an integer between 0 and 100: "
num = gets.chomp.to_i

puts english_num(num)