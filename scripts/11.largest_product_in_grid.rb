STR_20x20 = File.read("../helpers/helper.11.largest_product_in_grid.md")

MAT_20x20 = STR_20x20.lines.map { |line| line.split.map(&:to_i) }
# puts "mat dimensions: #{MAT_20x20.size}x#{MAT_20x20[0].size}"
# puts MAT_20x20

LIMIT = 4

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
class Node
  attr_accessor :left, :right, :top, :bottom,
                :tld, :trd, :bld, :brd,
                :prod_mat

  def initialize(row, col)
    @prod_mat = Array.new(3) { Array.new(3) { 0 } }

    @right  = get_right_elements(row, col)
    @left   = get_left_elements(row, col)
    get_top_elements(row, col)
    get_bottom_elements(row, col)
    get_tld_elements(row, col)
    get_trd_elements(row, col)
    get_bld_elements(row, col)
    get_brd_elements(row, col)
    update_prod_mat(row, col)
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
    @top = []

    (0...LIMIT).each do |itr|
      if (row - itr) >= 0
        @top.unshift(MAT_20x20[row - itr][col])
      else
        @top.unshift(0)
      end
    end
    @prod_mat[0][1] = @top.inject(:*)
  end

  def get_bottom_elements(row, col)
    @bottom = []

    (0...LIMIT).each do |itr|
      if (row + itr) < MAT_20x20.size
        @bottom.append(MAT_20x20[row + itr][col])
      else
        @bottom.append(0)
      end
    end
    @prod_mat[2][1] = @bottom.inject(:*)
  end

  def get_tld_elements(row, col)
    @tld = []
    (0...LIMIT).each do |itr|
      if (row - itr) >= 0 && (col - itr) >= 0
        @tld.unshift(MAT_20x20[row - itr][col - itr])
      else
        @tld.unshift(0)
      end
    end
    @prod_mat[0][0] = @tld.inject(:*)
  end

  def get_trd_elements(row, col)
    @trd = []
    (0...LIMIT).each do |itr|
      if (row - itr) >= 0 && (col + itr) < MAT_20x20.size
        @trd.unshift(MAT_20x20[row - itr][col + itr])
      else
        @trd.unshift(0)
      end
    end
    @prod_mat[0][2] = @trd.inject(:*)
  end

  def get_bld_elements(row, col)
    @bld = []
    (0...LIMIT).each do |itr|
      if (row + itr) < MAT_20x20.size && (col - itr) >= 0
        @bld.unshift(MAT_20x20[row + itr][col - itr])
      else
        @bld.unshift(0)
      end
    end
    @prod_mat[2][0] = @bld.inject(:*)
  end

  def get_brd_elements(row, col)
    @brd = []
    (0...LIMIT).each do |itr|
      if (row + itr) < MAT_20x20.size && (col + itr) < MAT_20x20.size
        @brd.unshift(MAT_20x20[row + itr][col + itr])
      else
        @brd.unshift(0)
      end
    end
    @prod_mat[2][2] = @brd.inject(:*)
  end

  def update_prod_mat(row, col)
    @prod_mat[1][0] = @left.inject(:*)
    @prod_mat[1][1] = { el: MAT_20x20[row][col], row: row, col: col }
    @prod_mat[1][2] = @right.inject(:*)
  end
end

# nd = Node.new(12, 6)
# p nd.prod_mat
# puts "right #{nd.right}"
# puts "left #{nd.left}"
# puts "top #{nd.top}"
# puts "bottom #{nd.bottom}"
# puts "tld #{nd.tld}"
# puts "trd #{nd.trd}"
# puts "bld #{nd.bld}"
# puts "brd #{nd.brd}"
# puts " mat: #{MAT_20x20[0][0]}, prod_mat: #{nd.prod_mat[1][1]}"
# p nd.prod_mat

max_prod = [0]
(0...MAT_20x20.size).each do |row|
  (0...MAT_20x20.size).each do |col|
    node = Node.new(row, col)
    max_val = [[node.prod_mat[1][0], node.prod_mat[1][2]].max,
               node.prod_mat[0].max, node.prod_mat[2].max].max
    max_prod = [max_val, node.prod_mat[1][1]] if max_prod[0] < max_val
  end
end

p max_prod
