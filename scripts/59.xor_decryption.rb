#STEP 1: read the encrypted text
text = File.read("../helpers/helper.59.cipher.txt").split(",").map(&:to_i)
# p text
# base = 'abc'.bytes
# cipher = base *  (text.size.to_f/base.size).ceil

#STEP 2: count the occurances of some of the most common english words
words = ["the", "is", "and"]

apply_xor = lambda {|word, base|
  decoded_text = []
  word.bytes.each_with_index do |ch, idx|
    # p ch ^ base[idx.modulo(base.size)]
  decoded_text.append( ch ^ base[idx.modulo(base.size)] )
  end
  decoded_text
}

# words.map {|w| p apply_xor.call(w)}
count_occurances = lambda {|code|
count = 0
text.each_with_index do |ch, idx|
  count +=1 if text[idx..(idx+2)].eql?(apply_xor.call("the", code))
end
# puts count
count
}
# (97...(97+26)).to_a.map {|n| p n.chr}.repeated_permutation(3)
#                    .map {|el| el.map(&:bytes).flatten}
#                    .map {|el| p el}

# STEP 3: identify the possible 3 letter encryption codes,
#         selecting the ones that hit "the" more than 5 times
(97...(97+26)).to_a.map(&:chr) #map {|n| p n.chr}
              .repeated_permutation(3)
              .map {|base| [base,count_occurances.call(base.map(&:bytes).flatten)]}
              .reject {|el| el.last.eql?(0)}
              .filter {|el| el.last >=5}
              .map {|el| p el}

#STEP 4: identify the correct code
codes = [#["d", "q", "s"],
["e", "x", "p"] ]#,
#["i", "l", "e"],
#["p", "e", "x"],
#["p", "h", "o"],
#["w", "x", "p"],
#["x", "p", "e"]]

codes.each do |cipher|
  cipher.map!(&:bytes).flatten!
  decoded_text = ""
  text.each_with_index do |ch, idx|
    # p ch ^ base[idx.modulo(base.size)]
    decoded_text += (ch ^ cipher[idx.modulo(cipher.size)]).chr
  end
  p cipher.map!(&:chr)#.flatten!
  puts decoded_text
  puts
end

#STEP 5: compute the sum as directed by the question
cipher = ["e", "x", "p"].map(&:bytes).flatten
ascii_chars = []
text.each_with_index do |ch, idx|
  # p ch ^ base[idx.modulo(base.size)]
  ascii_chars.append(ch ^ cipher[idx.modulo(cipher.size)])
end
p "ans #{ascii_chars.inject(:+)}"
# p text ^ cipher