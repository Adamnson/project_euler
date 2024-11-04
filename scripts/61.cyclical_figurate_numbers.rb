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

BASIS = %w[0 1 2 3 4 5 6 7 8 9]

two_digits = BASIS.repeated_permutation(2)

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
mega_set = mega_set.filter { |num| num.between?(1000, 9999) }
MS = mega_set
# puts tris.include?(8128)
# sqrs, pent, hexs, sept,

# puts mega_set
# puts octs.size
# puts sept.size
puts "mega set : #{mega_set.size}"
# puts "8128 : #{mega_set.include?(8128)}"
# puts "2882 : #{mega_set.include?(2882)}"

# t0 = Time.now
# mega_set.repeated_permutation(3)
#         .reject { |el| el.first == el.last && el.last == el[1] }
#         .filter { |el| all_cyclic.call el }.map { |el| p el }
# puts Time.now - t0

get_list_of_next_cyclic = lambda { |num|
  mega_set.select { |el| el.dcomp.first == num.dcomp.last }
  # [num].product(next_cyclic).flatten.each_slice(current_sequence_length.next).to_a
}
def extend_chain(chain_in)
  chain_out = []
  chain_in.each do |set_of_sequences|
    set_of_sequences.each do |sequence|
      next_cyclic = MS.select { |el| el.dcomp.first == sequence.last.dcomp.last }
      # next_cyclic.each do |el|
      # puts "to #{sequence} will be adding #{} "
      new_sequence = [sequence].product(next_cyclic).flatten.each_slice(3).to_a
      chain_out.append(new_sequence)
      # end
      # [pair].product(get_list_of_next_cyclic.call(pair.last)).flatten.each_slice(3).to_a
    end
  end
  chain_out
end

def extend_chain_to(chain_in, n)
  # p "input #{chain_in}"
  chain_out = []

  # binding.pry
  chain_in.each do |set_of_sequences|
    # array_of_sequences = []
    set_of_sequences.each do |sequence|
      next_cyclic = MS.select { |el| el.dcomp.first == sequence.last.dcomp.last }
      # next_cyclic.each do |el|
      # puts "to #{sequence} will be adding #{} "
      new_sequence = [sequence].product(next_cyclic).flatten.each_slice(n).to_a
      # p "extended sequence of #{sequence} is #{new_sequence}"
      chain_out.append new_sequence
      # p "after appending, size is #{chain_out.size}"
      # end
      # [pair].product(get_list_of_next_cyclic.call(pair.last)).flatten.each_slice(3).to_a
    end
    # chain_out.append array_of_sequences
  end
  # p chain_out
  chain_out
end

chain6 = []
chain2 = []
chain3 = []
mega_set.each do |num|
  chain2.append([num].product(get_list_of_next_cyclic.call(num)).flatten.each_slice(2).to_a)

  # chain2.each do |set_of_sequences|
  #   set_of_sequences.each do |sequence|
  #     # p sequence.last.dcomp.last
  #     #     chain3.append([sequence.last].product(get_list_of_next_cyclic.call(sequence.last)).flatten.each_slice(3).to_a)
  #     #     # [pair].product(get_list_of_next_cyclic.call(pair.last)).flatten.each_slice(3).to_a
  #   end
  # end
  # chain_ext2 = extend_chain(mega_set.map(&:to_a))

  # chain6 = extend_chain_to(chain2, 3)
  # chain6.append(extend_chain_to(chain3, 4))
  # chain5 = extend_chain_to(chain4, 5)
  # chain6 = extend_chain_to(chain5, 6)
end
# p chain6
# p chain2
puts "size2 #{chain2.size}"
# p chain2.first
# p chain2.first.size
t2 = Time.now
chain3 = extend_chain_to(chain2, 3)
# p chain3
puts "size3 :#{chain3.size}"
# p chain3.first
# p chain3.first.size
t3 = Time.now
chain4 = extend_chain_to(chain3, 4)
puts "size4: #{chain4.size}"
# p chain4.first
# p chain4.first.size
t4 = Time.now
chain5 = extend_chain_to(chain4, 5)
puts "size5: #{chain5.size}"
# p chain5.first
# p chain5.first.size
t5 = Time.now
chain6 = extend_chain_to(chain5, 6)
puts "size6: #{chain6.size}"
# p chain6.first
# p chain6.first.size
# p chain6
t6 = Time.now
specials = []
chain6.each do |set_of_sequences|
  set_of_sequences.each do |sequence|
    eval_arr = [sequence.last, sequence.first]
    eval_arr.append(cyclic?(eval_arr))
    # p "for #{sequence} we have #{eval_arr}"
    if eval_arr.last # rubocop:disable Style/Next
      tri_num = sequence.intersection(tris).one?
      sq_num = sequence.intersection(sqrs).one?
      pent_num = sequence.intersection(pent).one?
      hex_num = sequence.intersection(hexs).one?
      sept_num = sequence.intersection(sept).one?
      oct_num = sequence.intersection(octs).one?

      specials.append(sequence) if tri_num && sq_num && pent_num && hex_num && sept_num && oct_num
    end
  end
end
t_filt = Time.now
p specials
p specials.size

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
