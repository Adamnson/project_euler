def find_special_triplet(limit, target_sum = 1000)
  (1..limit).each do |i|
    (i..limit).each do |j|
      k = Math.sqrt((i**2) + (j**2))
      return [i, j, k.to_i] if (k.ceil - k).eql?(0.0) && (i + j + k).to_i.eql?(target_sum)
    end
  end
end

sol_array = find_special_triplet(500)
p sol_array, sol_array.inject(:*)
