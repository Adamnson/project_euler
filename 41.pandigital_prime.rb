require "./helper"

def get_all_pandigitals(n)
  return 0 if n.eql?(0)
  return 1 if n.eql?(1)
  return nil if n > 9

  basis = %w[1 2 3 4 5 6 7 8 9]
  basis.slice(0...n)
       .permutation
       .map { |p| p.inject(:+).to_i }
end

prime_pandigitals = (2..9).map do |i|
  get_all_pandigitals(i).filter(&:prime?)
end

p "ans: #{prime_pandigitals.flatten.max}"
