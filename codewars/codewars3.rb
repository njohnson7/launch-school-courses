# def circle_slash(n)
#   n % 2 == 0 ? 1 : n
# end


# circle_slash(5) ==
# 3
# circle_slash(11) ==
# 7
# circle_slash(1) ==
# 1
# circle_slash(2) ==
# 1
# circle_slash(3) ==
# 3
# circle_slash(4) ==
# 1
# circle_slash(8) ==
# 1
# circle_slash(16) ==
# 1
# circle_slash(15) ==
# 15
# circle_slash(31) ==
# 31




def strange_coach(players)
  letters = players.group_by { |name| name[0] }
                   .select { |_, names| names.size >= 5 }
                   .map(&:first)
                   .sort
                   .join
  letters.empty? ? 'forfeit' : letters
end

# strange_coach([
# "michael",
# "jordan",
# "lebron",
# "james",
# "kobe",
# "bryant"])
# # "forfeit"

# strange_coach([
#  "babic",
#  "keksic",
#  "boric",
#  "bukic",
#  "sarmic",
#  "balic",
#  "kruzic",
#  "hrenovkic",
#  "beslic",
#  "boksic",
#  "krafnic",
#  "pecivic",
#  "klavirkovic",
#  "kukumaric",
#  "sunkic",
#  "kolacic",
#  "kovacic",
#  "prijestolonasljednikovic"])
#  # "bk"

# strange_coach([
#  "jgztazpytubijfsmjz",
#  "bokvgratzzdibku",
#  "qineboilzoqdqivc",
#  "bfctyltibtkbxq",
#  "vioxcuhqhikxeqwekqkjo",
#  "nrvsdhttr",
#  "eiaoajuwxpwmyliqikzcchid",
#  "bxrwawgor",
#  "gbsqaxotzmblxttj",
#  "kwchrcaconuwaivhvnyf",
#  "neiemapiica",
#  "bppao",
#  "bxujiwivsjfbqrzygpdgkyz",
#  "jnzrhhmcgcpffflpzwmqib",
#  "jhozlevckrrwimdmyzc",
#  "bomojotkqqditelsk",
#  "ywmbheywzfyqjjs",
#  "snwrclyjkbspysjftcmyak",
#  "eelrsgkuhu",
#  "dnyzsvqjjuqoc"])
#  # "b"




def split_exp(num)
  left, right = num.split('.')
  left = left.chars.map.with_index(1) { |n, idx| "#{n}#{'0' * (left.size - idx)}" unless n == '0' }.compact
  right = right.chars.map.with_index { |n, idx| ".#{'0' * idx}#{n}" unless n == '0' }.compact if right
  left + right.to_a
end


def split_exp(num)
  left, right = num.split('.')
  left = add_zeros(left).reverse
  right = add_zeros(right.to_s.reverse).map(&:reverse).map { |n| ".#{n}" }
  left + right
end

def add_zeros(num)
  num.reverse.chars.map.with_index { |n, idx| "#{n}#{'0' * idx}" unless n == '0' }.compact
end

# p add_zeros "7970521"
# p add_zeros "5544"
# p split_exp "7970521.5544"

# split_exp("7970521.5544") == [
#  "7000000",
#  "900000",
#  "70000",
#  "500",
#  "20",
#  "1",
#  ".5",
#  ".05",
#  ".004",
#  ".0004"]

# split_exp("7496314") == [
#  "7000000",
#  "400000",
#  "90000",
#  "6000",
#  "300",
#  "10",
#  "4"]

# split_exp("0") == []

# split_exp("6") == ["6"]

# split_exp("1.0000000000") ==
# ["1"]

# split_exp("0000000000.1") == [".1"]

# split_exp( "0.99") == [
#  ".9",
#  ".09"]

# split_exp( "1.000009") == [
#  "1",
#  ".000009"]

# split_exp("1010101") == [
#  "1000000",
#  "10000",
#  "100",
#  "1"]

# split_exp("1234567890.1234567890") == [
#  "1000000000",
#  "200000000",
#  "30000000",
#  "4000000",
#  "500000",
#  "60000",
#  "7000",
#  "800",
#  "90",
#  ".1",
#  ".02",
#  ".003",
#  ".0004",
#  ".00005",
#  ".000006",
#  ".0000007",
#  ".00000008",
#  ".000000009"
#  ]

def min_and_max(min, max, sum)
  equals_sum = -> (num) { num.to_s.chars.map(&:to_i).reduce(:+) == sum }
  [(min..max).find(&equals_sum), max.downto(min).find(&equals_sum)]
end

# p min_and_max( 500,505,10)  # [505, 505]
# p min_and_max(100,200,10)  # [109, 190]
# p min_and_max(123,456,5)  # [131, 410]
# p min_and_max(99,501,5)  # [104, 500]
# p min_and_max(99,234,1)  # [100, 100]
# p min_and_max(99,234,19)  # [199, 199]
# p min_and_max(99,5001,27)  # [999, 4995]
# p min_and_max(99,5001,28)  # [1999, 4996]
# p min_and_max(2000,7000,3)  # [2001, 3000]






def smallest_integer(matrix)
  (0..Float::INFINITY).find { |num| !matrix.flatten.include?(num) }
end

def smallest_integer(matrix)
  (0..matrix.flatten!.max + 1).find { |num| !matrix.include?(num) }
end

# p smallest_integer([
#  [0,2],
#  [5,1]]) # 3

# p smallest_integer([
#  [4,5,3,21,3,8],
#  [2,2,6,5,10,9],
#  [7,5,6,8,2,6],
#  [1,4,7,8,9,0],
#  [1,3,6,5,5,1],
#  [2,7,3,4,4,3]]) # 11

# p smallest_integer([
#  [4,5,3,-4,3,8],
#  [2,0,6,5,4,9],
#  [7,5,6,8,2,6],
#  [1,4,7,8,9,11],
#  [1,3,10,5,5,1],
#  [12,7,3,4,4,3]]) # 13

# p smallest_integer([
#  [1,2],
#  [3,4]]) # 0

# p smallest_integer([
#  [0,1],
#  [2,3]]) # 4

# p smallest_integer([[4,5,13,0,3],
#  [2,6,5,10,9],
#  [7,5,-6,8,6],
#  [1,4,7,8,9],
#  [2,3,4,44,3]]) # 11

# p smallest_integer([
# [-1,100,-1,100],
# [100,-1,100,-1],
# [-1,100,-1,100],
# [100,-1,100,-1]]) # 0

# p smallest_integer([
# [-1,-1],
# [-1,-1]]) # 0



