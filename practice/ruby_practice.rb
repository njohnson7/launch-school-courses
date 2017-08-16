
def reversed_number(n)
  n.zero? ? 0 : (n % 10) * (p 10**Math.log10(n).to_i) + reversed_number(n / 10)
end

reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # Note that zeros get dropped!
reversed_number(1) == 1
reversed_number(101) == 101
reversed_number(1010567) == 7650101