require "rainbow"

class String
  def is_int?
    to_i.to_s == self
  end
end

def A(x)
  if x.is_int?
    x.to_i + 1
  else
    puts "+1 level deep #{x}"
    # ret_val = evaluateExpression(x)
    # evaluateExpression("A(#{ret_val})")
  end
end

def Z(u, v)
  v
end

def S(u, v, w)
  v + "(" + u + "(" + v + ")" + "(" + w + ")" + ")"
end

def apply_s(exp)
  # regex : /S(\(.{1,}\)){3}/g
  puts "Transform S"
  pattern = /S(\(.{1,}\)){3}/.match exp
  pattern_start_idx = exp.index(pattern.to_s)
  # puts exp.scan(/S(\(.{1,}\)){3}/pattern)
  l_exp = exp.split(")(")
  puts l_exp.inspect
  puts "calling s function on #{pattern} at #{pattern_start_idx}"
  last_idx_correction = l_exp.size == 3 ? -2 : -1
  u = l_exp.first[2..]
  v = l_exp[1]
  w = l_exp[2][..last_idx_correction]
  coloured_u = Rainbow(u).color(:forestgreen)
  coloured_v = Rainbow(v).color(:orangered)
  coloured_w = Rainbow(w).color(:darkorange)
  puts("u: #{coloured_u}\nv: #{coloured_v}\nw: #{coloured_w}")
  puts "#{S(coloured_u, coloured_v, coloured_w)}(#{l_exp[3..].join(')(')}"
  "#{S(u, v, w)}(#{l_exp[3..].join(')(')}"
end
exp1 = "S(Z)(A)(0)"
def evaluateExpression(exp)
  if /^S(\(.{1,}\)){3}/.match exp
    apply_s exp
  elsif /^Z(\(.{1,}\)){2}/.match exp
    # regex : /Z(\(.{1,}\)){2}/g
    l_exp = exp.split(")(")
    puts "calling z function #{l_exp}"
    last_idx_correction = l_exp.size == 2 ? -2 : -1
    u = l_exp.first[2..]
    v = l_exp[1][..last_idx_correction]
    puts "u: #{u}\nv: #{v}"
    "#{Z(u, v)}(#{l_exp[2..].join(')(')}"
  elsif exp.start_with? "A"
    # regex : /A(\(.\)){1}/g
    puts "calling a function"
    puts A(exp[2..-2])
  end
end
apply_s exp1

# #check this
out = []
eqn = "S(S)(S(S))(S(Z))(A)(O)"
out.append(eqn)
apply_s eqn

out.append(evaluateExpression(eqn))
puts "Iteration 1 => #{out.last}"
# 4.times do |itr|
#   out.append(evaluateExpression(out.last))
#   puts "Iteration #{itr} => #{out.last}"
# end
out.append(apply_s(out.last))
puts out

# works
# exp2 = evaluateExpression(exp1)
# puts exp2
# exp3 = evaluateExpression(exp2)
# puts exp3

# Migration plan
# X. Copy code
# 2. Make tests
# 3*. colourize print for illustration
# puts exp1.split(/S(\(.{1,}\)){3}/)
# puts "splitting"
# p exp1.split(/S((.{1,})(.{1,})(.{1,}))/)
# puts /^S(\(.{1,}\)){3}/.match('S(S)(S(S))(S(Z))').to_s.split(")(")
# puts(/^S(\(.{1,}\)){3}/.match("S(S)(S(S))(S(Z))").to_s.split(")("))
# p (/S\((.{1,})\){3}/.match 'S(S)(S(S))(S(Z))')
# puts exp1.split(/S(\(.{1,}\)\-1\(.{1,}\)\-2\(.{1,}\)\-3)/)
# puts /^S(\(.{1,}\)){3}/.match('S(S)(S(S))(S(Z))').to_s.split(")(")
# puts /^S(\(.\)){3}/.match('S(Z)(A)(0)')
# puts /^S(\(.{1,}\)){3}/.match('S(S)(S(S))(S(Z))').to_s.split(")(")
#
# if /^Z(\(.\)){2}/.match('S(Z)(A)(0)')
#   puts "should not have been true"
# else
#   puts "works"
# end
# puts /(\(.\))-\1(\(.\))-\2(\(.\))-\3/.match('S(Z)(A)(0)')
# evaluateExpression('S(Z)(A)(0)')
# ret_val = 'Z(A)(0)'
#
#
# puts "checking 1245 #{'12'.is_int?}"
# puts "checking dr #{'dr'.is_int?}"
# 2.times do |i|
#   ret_val = evaluateExpression(ret_val)
#   puts "#{i}: #{ret_val}"
# end
# puts ret_val
# elsif exp1.first.start_with 'A'
# puts exp1
#
# if exp1.start_with? 'Z'
#   puts "calling z function"
# end
# exp2 = 'S(S)(S(S))(S(Z))(A)(0)'
# puts exp2.split(")(")
# puts A(5)
# puts Z('A', 0)
# puts Z('A', 'A')
# step = S('Z','A', '0')

# def getSparams(str)
#    p "#{ str[0]=='S' ?  "valid start" :  "off on the wrong foot" }"
#    p "#{ str[-6..]=='(A)(0)' ? "valid end" : "the end needs a look"}"
#    v = 'A'
#    w = '0'
#    u = str[2]
#
#    puts "u:#{u}\nv:#{v}\nw:#{w}"
# end
#
#  getSparams('S(Z)(A)(0)')
# 1. s(s)(s(s))(s(z))(a)(0)
#   u = s
#   v = s(s)
#   w = s(z)
# 2. s(s)( s(s(s))(s(z))  )(a)(0)
#   u = s
#   v = s(s(s))(s(z))
#   w = a
#
#
#
# C0 = 'Z'
#
# def getCn(n)
#   return 'S(' +C0 + ')' if n.eql? 1
#
#   'S('+ getCn(n-1) +')'
# end
#
# puts getCn 5
#
# def getDn(n)
#   getCn(n) + '(S)(S)'
# end
#
# puts getDn(12)
