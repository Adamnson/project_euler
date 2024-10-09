max = [0, 0]
length = 0

(1..10).each do |denominator|
  frac = (1.0 / denominator)
  string100 = ""
  25.times do
    string100.concat((frac.modulo 10).to_s)
    frac *= 10
  end

  p [denominator, string100.size, string100.count(".")]
  # rep_index = -1
  # match_index = frac.to_s.size
  # length = 0
  # puts "i: #{denominator} frac: #{frac} "
  # match_index = frac.to_s.reverse.index(frac.to_s[-2], 2) || match_index
  # rep_index = frac.to_s.reverse.index(frac.to_s[-2], 2 + match_index) unless match_index.nil?
  # length = (match_index - 1) unless match_index.nil?
  # if !rep_index.nil? && frac.to_s[rep_index, length].eql?(frac.to_s[match_index, length]) && length > (max[1])
  #   max = [denominator, length, frac.to_s[-2 - match_index, length]]
  # end
end

# puts "max rep cycle : #{max}"
