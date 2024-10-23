basis = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

basis.permutation.each_with_index do |ans, idx|
  p ans if idx.eql?(1_000_000 - 1)
end
