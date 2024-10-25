require_relative "../helpers/18.max_path_sum_1"

NUMBERS67 = File.read("../helpers/helper.67_triangle.md").split("\n")

tree = Tree.new(NUMBERS67)
sum, seq = tree.calc_sum_of_triangle(NUMBERS67.size - 2)
puts "sum is #{sum}"
p seq
