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
    pattern_start_idx = exp.index(pattern.to_s)
    # puts exp.scan(/S(\(.{1,}\)){3}/pattern)
    l_exp = exp.split(")(")
    puts l_exp.inspect, l_exp.size
    puts "calling s function on #{pattern} at #{pattern_start_idx}"
    third_param_last_idx_correction = l_exp.size == 3 ? -2 : -1
    u = l_exp.first[2..]
    v = l_exp[1]
    w = l_exp[2][..third_param_last_idx_correction]
    coloured_u = Rainbow(u).color(:forestgreen)
    coloured_v = Rainbow(v).color(:orangered)
    coloured_w = Rainbow(w).color(:darkorange)
    puts("u: #{coloured_u}\nv: #{coloured_v}\nw: #{coloured_w}")
    puts "#{S(coloured_u, coloured_v, coloured_w)}#{l_exp.size == 3 ? '' : l_exp[3..].join(')(')}"
    "#{S(u, v, w)}#{l_exp.size == 3 ? '' : "(#{l_exp[3..].join(')(')}"}"
  end

  private

  def Z(u, v)
    v
  end

  def S(u, v, w)
    v + "(" + u + "(" + v + ")" + "(" + w + ")" + ")"
  end
end

sza0 = L_Exp.new("S(Z)(A)(0)")

puts sza0.value

puts "using return value #{sza0.apply_s}"

puts sza0.value

s5za0 = L_Exp.new "S(S)(S(S))(S(Z))(A)(O)"

puts "using return value #{s5za0.apply_s}"
