require_relative "../helpers/special_helper"
require "pry-byebug"
# (1..5).to_a.map { |el| p "t #{el.triangle}" }
# (1..5).to_a.map { |el| p "s #{el.square}" }
# (1..5).to_a.map { |el| p "p #{el.pentagon}" }
# (1..5).to_a.map { |el| p "h #{el.hexagon}" }
# (1..5).to_a.map { |el| p "hp #{el.heptagon}" }
# (1..5).to_a.map { |el| p "o #{el.octagon}" }

# puts([1, 3, 6, 10, 15].map { |i| i.triangle_idx })
# puts([1, 4, 9, 16, 25].map { |i| i.square_idx })
# puts([1, 5, 12, 22, 35].map { |i| i.pentagon_idx })
# puts([1, 6, 15, 28, 45].map { |i| i.hexagon_idx })
# puts([1, 7, 18, 34, 55].map { |i| i.heptagon_idx })
# puts([1, 8, 21, 40, 65].map { |i| i.octagon_idx })

# BASIS = %w[0 1 2 3 4 5 6 7 8 9]

# two_digits = BASIS.repeated_permutation(2)

# two_digits.map { |el| el.inject(:+) }
#           .reject { |el| el.start_with?("0") }
#           .map { |el| p el }
class Array
  def split_into_two_digit_numbers
    map(&:to_s).map { |num_str| [num_str.slice(0, num_str.length / 2), num_str[(num_str.length / 2)..]] }
  end
end

class Integer
  def dcomp
    [self].split_into_two_digit_numbers.flatten
  end

  def to_a
    [self]
  end
end

p [1224, 1221, 3549, 7238].split_into_two_digit_numbers

puts "#{[4433.dcomp.first, 4433.dcomp.last]}"
def cyclic?(two_numbers)
  split_nums = two_numbers.map(&:to_s)
                          .map { |num_str| [num_str.slice(0, num_str.length / 2), num_str[(num_str.length / 2)..]] }
  split_nums.first.last.eql?(split_nums.last.first)
end

p cyclic?([8128, 2882])

all_cyclic = lambda { |array_of_numbers|
  ret_vals = []
  idx = 0
  while idx < (array_of_numbers.size - 1)
    ret_vals.append(cyclic?(array_of_numbers.slice(idx, 2)))
    idx += 1
  end
  ret_vals.append(cyclic?([array_of_numbers.last, array_of_numbers.first])).all?
}

p "set of3 numbers cyclic? #{all_cyclic.call([8128, 2882, 8281])}"

# (1..142).to_a.map(&:triangle).map { |el| p el }
octs = (1..60).to_a.map(&:octagon)
sept = (1..65).to_a.map(&:heptagon)
hexs = (1..72).to_a.map(&:hexagon)
pent = (1..83).to_a.map(&:pentagon)
sqrs = (1..101).to_a.map(&:square)
tris = (1..142).to_a.map(&:triangle)

mega_set = []
mega_set.concat(octs, sept, hexs, pent, sqrs, tris)
mega_set = mega_set.uniq
mega_set = mega_set.filter { |num| num.between?(1000, 9999) }
MS = mega_set
puts "mega set : #{mega_set.size}"

get_list_of_next_cyclic = lambda { |num|
  mega_set.select { |el| el.dcomp.first == num.dcomp.last }
}

def extend_chain_to(chain_in, n)
  chain_out = []
  # binding.pry
  chain_in.each do |set_of_sequences|
    set_of_sequences.each do |sequence|
      next_cyclic = MS.select { |el| el.dcomp.first == sequence.last.dcomp.last }
      new_sequence = [sequence].product(next_cyclic).flatten.each_slice(n).to_a
      chain_out.append new_sequence
    end
  end
  chain_out
end

chain2 = []
mega_set.each do |num|
  chain2.append([num].product(get_list_of_next_cyclic.call(num)).flatten.each_slice(2).to_a)
end
puts "size2 #{chain2.size}"
t2 = Time.now
chain3 = extend_chain_to(chain2, 3)
puts "size3 :#{chain3.size}"
t3 = Time.now
chain4 = extend_chain_to(chain3, 4)
puts "size4: #{chain4.size}"
t4 = Time.now
chain5 = extend_chain_to(chain4, 5)
puts "size5: #{chain5.size}"
t5 = Time.now
chain6 = extend_chain_to(chain5, 6)
puts "size6: #{chain6.size}"
t6 = Time.now
specials = []
chain6.each do |set_of_sequences|
  set_of_sequences.each do |sequence|
    specials.append(sequence) if all_cyclic.call(sequence)
  end
end
t_filt = Time.now
p specials
p specials.size

specials.each do |sq|
  tri_num = sq.intersection(tris)
  sq_num = sq.intersection(sqrs)
  pent_num = sq.intersection(pent)
  hex_num = sq.intersection(hexs)
  sept_num = sq.intersection(sept)
  oct_num = sq.intersection(octs)
  presence_condition = tri_num.one? && sq_num.one? && pent_num.one? && hex_num.one? && sept_num.one? && oct_num.one?
  # unique_condition = (sequence.count(tri_num) == 1) && (sequence.count(sq_num) == 1) && (sequence.count(pent_num) == 1) && (sequence.count(hex_num) == 1) && (sequence.count(sept_num) == 1) && (sequence.count(oct_num) == 1)

  puts "found #{sq}" if presence_condition # && unique_condition
end

puts "extending 2 to 3 : #{t3 - t2}"
puts "extending 3 to 4 : #{t4 - t3}"
puts "extending 4 to 5 : #{t5 - t4}"
puts "extending 5 to 6 : #{t6 - t5}"
puts "finding sets : #{t_filt - t6}"
# arr = [5151, 5151, 5151, 5192, 9216, 1651]

# puts "3 #{arr.intersection(tris)}"
# puts "4 #{arr.intersection(sqrs)}"
# puts "5 #{arr.intersection(pent)}"
# puts "6 #{arr.intersection(hexs)}"
# puts "7 #{arr.intersection(sept)}"

# mega set : 351
# size2 351
# size3 :1240
# size4: 4403
# size5: 15615
# size6: 55593
# []
# 0
# extending 2 to 3 : 0.830420227
# extending 3 to 4 : 3.111120412
# extending 4 to 5 : 11.129886469
# extending 5 to 6 : 56.6917714
# finding sets : 0.245731697

# mega_set.uniq
# mega set : 299
# size2 299
# size3 :889
# size4: 2661
# size5: 7957
# size6: 23810
# []
# 0
# extending 2 to 3 : 0.460597973
# extending 3 to 4 : 1.36717381
# extending 4 to 5 : 4.406571893
# extending 5 to 6 : 18.817721291
# finding sets : 1.123641837
