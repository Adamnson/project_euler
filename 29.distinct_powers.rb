terms = []
limit = 100
(2..limit).each do |a|
  (2..limit).each do |b|
    terms.append(a.pow(b))
  end
end

puts terms.uniq.size
