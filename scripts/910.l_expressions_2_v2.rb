require "rainbow"
class L_Exp
  attr_accessor :value

  def initialize(val)
    @value = val
  end

  def apply_s(exp = @value)
    # regex : /S(\(.{1,}\)){3}/g
    puts "Transform S"
    pattern = /S(\(.{1,}\)){3}/.match exp
    # pattern = /S((\()(.+)(\))){3}/.match exp
    pattern_start_idx = exp.index(pattern.to_s)
    # puts exp.scan(/S(\(.{1,}\)){3}/pattern)
    l_exp = exp.split(")(")
    puts "before:[#{l_exp.inspect}], [#{l_exp.size}]"
    l_exp.each_with_index do |sub_pattern, idx|
      next if (sub_pattern == l_exp.first) or (sub_pattern == l_exp.last)

      next unless sub_pattern.count("(") != sub_pattern.count(")")

      puts "editing #{sub_pattern} and #{l_exp[idx + 1]}"
      l_exp[idx] += "#{l_exp[idx + 1]}"
      l_exp[idx + 1] = ""
    end
    l_exp.reject! { |el| el.eql?("") }
    puts "after:[#{l_exp.inspect}], [#{l_exp.size}]"
    puts "calling s function on #{pattern} at #{pattern_start_idx}"
    third_param_last_idx_correction = l_exp.size == 3 ? -2 : -1
    u = l_exp.first[2..]
    v = l_exp[1]
    w = l_exp[2][..third_param_last_idx_correction]
    coloured_u = Rainbow(u).color(:forestgreen)
    coloured_v = Rainbow(v).color(:orangered)
    coloured_w = Rainbow(w).color(:darkorange)
    if (u.count("(") != u.count(")")) or (v.count("(") != v.count(")")) or (w.count("(") != w.count(")"))
      puts Rainbow("Found bracket count mismatch : ").color(:red)
    end
    puts("u: #{coloured_u}\nv: #{coloured_v}\nw: #{coloured_w}")
    puts "#{S(coloured_u, coloured_v, coloured_w)}#{l_exp.size == 3 ? '' : l_exp[3..].join(')(')}"
    "#{S(u, v, w)}#{l_exp.size == 3 ? '' : "(#{l_exp[3..].join(')(')}"}"
  end

  def compute
    if @value.start_with?("A(")
      identify_params(1)
    elsif @value.start_with?("Z(")
      identify_params(2)
    elsif @value.start_with?("S(")
      identify_params
    end
  end

  def identify_params(num = 3)
    number_of_open_brackets = 0
    skip_1_char = false
    buffer = ""
    params = []
    @value.chars.each_with_index do |ch, idx|
      number_of_open_brackets += 1 if ch == "("
      number_of_open_brackets -= 1 if ch == ")"
      if number_of_open_brackets.zero? and idx.positive?
        params.append(buffer)
        return params if params.size == num

        buffer = ""
        skip_1_char = true
        next
      end
      if skip_1_char
        skip_1_char = false
        next
      end
      buffer += ch if idx > 1
    end
  end

  private

  def Z(u, v)
    v
  end

  def S(u, v, w)
    v + "(" + u + "(" + v + ")" + "(" + w + ")" + ")"
  end
end
=begin
test_1 = L_Exp.new("A(S(Z)(A)(0))")
p "test 1"
puts test_1.compute

test_2 = L_Exp.new("Z(1)(1)")
p "test 2"
puts test_2.compute
=end
test_3 = L_Exp.new("S(Z)(A)(0)")
p "test 3"
puts test_3.compute
=begin
test_4 = L_Exp.new("S(S)(S(S))(S(Z))(A)(O)")
p "test 4"
puts test_4.compute
=end
# sza0 = L_Exp.new("S(Z)(A)(0)")
#
# puts sza0.value
#
# puts "using return value #{sza0.apply_s}"
#
# puts sza0.value
# s5za0 = L_Exp.new "S(S)(S(S))(S(Z))(A)(O)"
#
# after_step_1 = L_Exp.new(s5za0.apply_s)
# puts "using return value #{after_step_1.value}"
#
# after_step_2 = L_Exp.new(after_step_1.apply_s)
# puts "using return value #{after_step_2.value}"
#
# after_step_3 = L_Exp.new(after_step_2.apply_s)
# puts "using return value #{after_step_3.value}"
