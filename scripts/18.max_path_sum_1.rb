NUMBERS = File.read("../helpers/helper.18.max_path_sum_1_test.md").split("\n")

# a node is associated with each number in the triange
# each node has a left and a right node
class Node
  attr_accessor :left, :right, :value, :row, :col, :up, :sum

  def initialize(value, pos = [0, 0])
    @value = value
    @left = left
    @right = right
    @row = pos[0]
    @col = pos[1]
    @sum = [0, []]
  end

  def leaf_node?
    @left.nil? && @right.nil?
  end
end

# a tree represents the given number triangle
# a tree is made up of nodes holing the value at
#   the corresponding position in the triangle
class Tree
  attr_accessor :root, :nodes

  def initialize(numbers_array)
    @nodes = []
    make_nodes(numbers_array)
    @root = @nodes.filter { |e| e.row.eql?(0) && e.col.eql?(0) }[0]
    @root.sum = @root.value
    assign_left_and_right_nodes(numbers_array.size - 1)
    update_sum_in_leaf_nodes
  end

  def make_nodes(numbers_array)
    numbers_array.each_with_index do |line, row|
      line_array = line.split.map(&:to_i)
      line_array.each_with_index do |val, col|
        node = Node.new(val, [row, col])
        # puts "Created a node for #{node.value} [#{node.row}, #{node.col}]"
        @nodes.append(node)
      end
    end
  end

  def assign_left_and_right_nodes(last_row_of_triangle) # rubocop:disable Metrics/AbcSize
    @nodes.each do |node|
      next if node.row.eql?(last_row_of_triangle)

      node.left  = @nodes.select { |e| [e.row, e.col].eql?([node.row + 1, node.col]) }.shift
      node.right = @nodes.select { |e| [e.row, e.col].eql?([node.row + 1, node.col + 1]) }.shift
    end
  end

  def update_sum_in_leaf_nodes
    @nodes.filter(&:leaf_node?)
          .map { |e| e.sum = [e.value, [e.value]] }
  end

  def calc_sum_of_triangle(row_num, stop_row = 0) # rubocop:disable Metrics/AbcSize
    # start from the second last row (n-1 row)
    # calculate sum of node + left and node + right
    # store sum along with chain
    # call function again with previous row
    # if row_num is 0, add root value and return max

    nodes_list = @nodes.filter { |e| e.row.eql?(row_num) }
    nodes_list.each do |node|
      better_node = node.left.sum[0] > node.right.sum[0] ? node.left : node.right
      node.sum = [better_node.sum[0] + node.value, [node.value].append(better_node.sum[1]).flatten]
      return node.sum if row_num.eql?(stop_row)
    end
    calc_sum_of_triangle(row_num - 1)
  end

  def pretty_print(node = @root, flag = 0, prefix = "", is_left: true)
    pretty_print(node.right, flag, "#{prefix}#{is_left ? '│   ' : '    '}", is_left: false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{flag.positive? ? node.sum[0] : node.value}"
    pretty_print(node.left, flag, "#{prefix}#{is_left ? '    ' : '│   '}", is_left: true) if node.left
  end
end

tree = Tree.new(NUMBERS)

# p tree.root.value
# p "Numbers size : #{NUMBERS.size}"
# puts tree.root.left.value
# puts tree.root.right.value
# puts tree.nodes.size
# tree.pretty_print
# tree.pretty_print(tree.root, 1) # special adaptation to print the sums

sum, seq = tree.calc_sum_of_triangle(NUMBERS.size - 2)
puts "sum is #{sum}"
p seq
