# easy7_06.rb
# Staggered Caps 2

# Modify the method from the previous exercise so it ignores non-alphabetic
#  characters when determining whether it should uppercase or lowercase each
#  letter. The non-alphabetic characters should still be included in the return
#  value; they just don't count when toggling the desired case.

def staggered_case(str)
  need_upper = true
  str.chars.map do |c|
    if c =~ /[a-z]/i && need_upper == true
      need_upper = !need_upper
      c.upcase
    elsif c =~ /[a-z]/i && need_upper == false
      need_upper = !need_upper
      c.downcase
    else
      c
    end
  end.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
puts


# Alternate solution:
def staggered_case(str)
  need_upper = false
  str.chars.map do |c|
    if c =~ /[a-z]/i
      need_upper = !need_upper
      need_upper ? c.upcase : c.downcase
    else
      c
    end
  end.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
puts


# Modify this method so the caller can determine whether non-alphabetic
# characters should be counted when determining the upper/lowercase state. That
# is, you want a method that can perform the same actions that this method does,
# or operates like the previous version.

# Hint: Use a keyword argument.

def staggered_case(str, count_non_alpha: false)
  need_upper = false
  str.chars.map do |c|
    if c =~ /[a-z]/i
      need_upper = !need_upper
      need_upper ? c.upcase : c.downcase
    else
      need_upper = !need_upper if count_non_alpha == true
      c
    end
  end.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS', count_non_alpha: false) == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
p staggered_case('I Love Launch School!', count_non_alpha: true)
p staggered_case('ALL CAPS', count_non_alpha: true)
p staggered_case('ignore 77 the 444 numbers', count_non_alpha: true)
