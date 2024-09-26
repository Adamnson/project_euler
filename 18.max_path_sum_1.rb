NUMBERS = File.read("helper.18.max_path_sum_1.md").split("\n")
# NUMBERS = File.read("helper.18.max_path_sum_1_test.md").split("\n")

# NUMBERS.each_with_index do |line, _idx|
#   arr = line.split.map(&:to_i)
#   p arr
# end

# a node is associated with each number in the triange
# each node has a left and a right node
class Node
  attr_accessor :left, :right, :value, :row, :col

  def initialize(value, pos = [0, 0])
    @value = value
    @left = left
    @right = right
    @row = pos[0]
    @col = pos[1]
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
    assign_left_and_right_nodes(numbers_array.size - 1)
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

  def assign_left_and_right_nodes(last_row_of_triangle)
    @nodes.each do |node|
      unless node.row.eql?(last_row_of_triangle)
        node.left = @nodes.filter { |e| e.row.eql?(node.row + 1) && e.col.eql?(node.col) }[0]
        node.right = @nodes.filter { |e| e.row.eql?(node.row + 1) && e.col.eql?(node.col + 1) }[0]
      end
    end
  end

  def pretty_print(node = @root, prefix = "", is_left: true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", is_left: false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", is_left: true) if node.left
  end
end

tree = Tree.new(NUMBERS)

p tree.root.value
puts tree.root.left.value
puts tree.root.right.value
puts tree.nodes.size
# tree.pretty_print
