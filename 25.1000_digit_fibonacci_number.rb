# class FibNum stores the following data
# n1, n2, n : three consequtive terms in the sequence
# pos : position/index of n in the sequence
# the next method, calculates the next number in the sequence
#  and updates n1, n2 and pos
class FibNum
  attr_accessor :n1, :n2, :n, :pos

  def initialize
    @n1 = 1
    @n2 = 1
    @n = @n1 + @n2
    @pos = 3
  end

  def next
    @n1 = @n2
    @n2 = @n
    @n = @n1 + @n2
    @pos += 1
  end
end

f = FibNum.new

f.next while f.n.to_s.size < 1000
p [f.n1, f.n2, f.n, f.pos]
