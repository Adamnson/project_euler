require_relative "../helpers/helper"

primes = (1..1_000_000).filter(&:prime?)

p primes.size

class Integer
  def truncatable?
    left_truncatable? && right_trucatable?
  end

  def left_truncatable?
    arr = to_s.chars
    while arr.size.positive?
      dropped_digit = arr.pop
      new_num = arr.empty? ? dropped_digit.to_i : arr.inject(:+).to_i
      return false unless new_num.prime?
    end
    true
  end

  def right_trucatable?
    arr = to_s.chars
    while arr.size.positive?
      dropped_digit = arr.shift
      new_num = arr.empty? ? dropped_digit.to_i : arr.inject(:+).to_i
      return false unless new_num.prime?
    end
    true
  end
end

trunk = primes.filter(&:truncatable?).filter { |p| p > 10 }
p [trunk, trunk.size]
puts "ans: #{trunk.inject(:+)}"
