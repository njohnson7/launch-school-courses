# @cipher = Cipher.new
# @cipher.encode("iamapandabear") #=> "ldpdsdqgdehdu"
# @cipher.decode("ldpdsdqgdehdu") #=> "iamapandabear"

# # Shift ciphers are no fun though when your kid sister figures it out. Try
# # amending the code to allow us to specify a key and use that for the shift
# # distance. This is called a substitution cipher.

# # Here's an example:

# @cipher = Cipher.new("aaaaaaaaaaaaaaaaaa")
# @cipher.encode("iamapandabear") #=> "iamapandabear"
# @cipher = Cipher.new("ddddddddddddddddd")
# @cipher.encode("imapandabear") #=> "lpdsdqgdehdu"

# @cipher = Cipher.new
# @cipher.key #=> "duxrceqyaimciuucnelkeoxjhdyduucpmrxmaivacmybmsdrzwqxvbxsygzsa
#             #    bdjmdjabeorttiwinfrpmpogvabiofqexnohrqu"
# rules:
  # if no key given, generate a random key of 100+ letters [a-z]
    # access via: Cipher#key
  # if given key has any capital letters or nums, or is empty, raise ArgumentError
  # key: each letter is shifted by distance from 'a'


# Cipher = Struct.new(:key) do
#   LETTERS = ('a'..'z').each_with_index.to_h.freeze

#   def initialize(key = Array.new(100) { LETTERS.keys.sample }.join)
#     raise ArgumentError if key&.match(/[^a-z]|\A\z/)
#     self.key = key || Array.new(100) { LETTERS.keys.sample }.join
#   end

#   def encode(text)
#     code(text, :+)
#   end

#   def decode(text)
#     code(text, :-)
#   end

#   def code(text, op)
#     text.chars.zip(key.chars)
#         .map { |a, b| LETTERS.key(LETTERS.values_at(a, b).reduce(op) % 26) }.join
#   end
# end


  # %w[encode + decode -].each_slice(2) { |m, op| define_method(m) { |text| code(text, op) } }
  # [[:encode, :+], [:decode, :-]].each { |m, op| define_method(m) { |text| code(text, op) } }






Cipher = Struct.new(:key) do
  LETTERS = ('a'..'z').each_with_index.to_h.freeze

  def initialize(key = Array.new(100) { LETTERS.keys.sample }.join)
    key.match?(/\A[a-z]+\z/) ? self.key = key : raise(ArgumentError)
  end

  def code(text, op)
    text.chars.zip(key.chars)
        .map { |a, b| LETTERS.key(LETTERS.values_at(a, b).reduce(op) % 26) }.join
  end

  %w[en + de -].each_slice(2) { |m, op| define_method("#{m}code") { |t| code(t, op) } }
end
