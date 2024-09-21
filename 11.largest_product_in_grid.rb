STR_20x20 = "08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08
49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00
81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65
52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91
22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80
24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50
32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70
67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21
24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72
21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95
78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92
16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57
86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58
19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40
04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66
88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69
04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36
20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16
20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54
01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48"

MAT_20x20 = STR_20x20.lines.map { |line| line.split.map(&:to_i) }
puts "mat dimensions: #{MAT_20x20.size}x#{MAT_20x20[0].size}"
# puts MAT_20x20

LIMIT = 4
limit = 4
prod_vector = Array.new(Array.new(4, 0))
p "prod_vector: #{prod_vector}"
prod_h = prod_v = prod_ld = prod_rd = []
prod_h_max = prod_v_max = prod_ld_max = prod_rd_max = [0]

p prod_h_max, prod_v_max, prod_ld_max, prod_rd_max
(0..(MAT_20x20.size - 1)).each do |i|
  (0..(MAT_20x20.size - limit)).each do |j|
    prod_h = MAT_20x20[i][j, limit] # .inject(:*)
    # MAT_20x20.each_with_index { |line, idx| prod_v.append(line[j]) if (i..(i + limit)).include?(idx) }
    # p prod_h
    prod_h_max = [prod_h.inject(:*), prod_h, [i, j]] if prod_h.inject(:*) > prod_h_max[0]
  end
end

(0..(MAT_20x20.size - limit)).each do |i|
  (0..(MAT_20x20.size - 1)).each do |j|
    prod_v = (i...(i + limit)).map { |k| MAT_20x20[k][j] } # .inject(:*)
    # MAT_20x20.each_with_index { |line, idx| prod_v.append(line[j]) if (i..(i + limit)).include?(idx) }
    # p prod_v
    prod_v_max = [prod_v.inject(:*), prod_v, [i, j]] if prod_v.inject(:*) > prod_v_max[0]
  end
end

(0..MAT_20x20.size - limit).each do |i|
  (0..MAT_20x20.size - limit).each do |j|
    prod_ld = (0...limit).map { |k| MAT_20x20[i + k][j + k] }
    # p prod_ld
    prod_ld_max = [prod_ld.inject(:*), prod_ld, [i, j]] if prod_ld.inject(:*) > prod_ld_max[0]
  end
end

# (limit..MAT_20x20.size).each do |i|
#   (0..(MAT_20x20.size - limit)).each do |j|
#     # prod_rd = (0...limit).map { |k| MAT_20x20[i - k][j + k] }
#     p [i, j]
#     # prod_ld_max = [prod_ld.inject(:*), prod_ld, [i, j]] if prod_ld.inject(:*) > prod_ld_max[0]
#   end
# end
#
prod_vector = [prod_h_max, prod_v_max, prod_ld_max]

ans = (prod_vector.each { |vec| vec[0] }).max
p " horiz : #{prod_h_max} "
p " vert : #{prod_v_max} "
p " diag : #{prod_ld_max}"
p " ans: #{ans}"

class Node
  # a node calcs and stores the following
  # 1) up array
  # 2) down array
  # 3) left array
  # 4) right array
  # 5) top left diagonal
  # 6) top right diagonal
  # 7) bottom left diagonal
  # 8) bottom right diagonal
  # 9) a 3x3 matrix with the above products
  # the default value in the matix is 0
  # if the particular matrix does not span upto "limit"
  #   number of entries, fill it with as many availabe

  attr_accessor :left, :right, :top, :bottom,
                :tld, :trd, :bld, :brd,
                :prod_mat

  def initialize(row, col)
    @prod_mat = Array.new(3) { Array.new(3) { 0 } }
    @prod_mat[1][1] = MAT_20x20[row][col]

    @right = get_right_elements(row, col)
    @left  = get_left_elements(row, col)
    @top   = get_top_elements(row, col)
    @bottom = get_bottom_elements(row, col)
  end

  def get_right_elements(row, col)
    if col + LIMIT >= MAT_20x20.size
      MAT_20x20[row][col..].append(Array.new(col + LIMIT - MAT_20x20.size) { 0 }).flatten
    else
      MAT_20x20[row][col, LIMIT]
    end
  end

  def get_left_elements(row, col)
    if (col - LIMIT).negative?
      Array.new(LIMIT - col - 1) { 0 }.append(MAT_20x20[row][..col]).flatten
    else
      MAT_20x20[row][col - LIMIT + 1, LIMIT]
    end
  end

  def get_top_elements(row, col)
    top = []
    if (row - LIMIT).positive?
      LIMIT.times do |itr|
        top.append(MAT_20x20[row - LIMIT + 1 + itr][col])
      end
    else
      (LIMIT - row - 1).times { top.append(0) }
      (row + 1).times do |itr|
        top.append(MAT_20x20[itr][col])
      end
    end
    top
  end

  def get_bottom_elements(row, col)
    bottom = []
    if (row + LIMIT) < MAT_20x20.size
      LIMIT.times do |itr|
        bottom.append(MAT_20x20[row + itr][col])
      end
    else
      (MAT_20x20.size - row).times do |itr|
        bottom.append(MAT_20x20[row + itr][col])
      end
      (LIMIT - MAT_20x20.size + row).times { bottom.append(0) }
    end
    bottom
  end
end

nd = Node.new(14, 12)
p nd.prod_mat
puts "right #{nd.right}"
puts "left #{nd.left}"
puts "top #{nd.top}"
puts "bottom #{nd.bottom}"
# puts " mat: #{MAT_20x20[0][0]}, prod_mat: #{nd.prod_mat[1][1]}"
