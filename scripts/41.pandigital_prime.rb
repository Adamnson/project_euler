require_relative "../helpers/helper"

def get_all_pandigitals(size)
  return 0 if size.eql?(0)
  return 1 if size.eql?(1)
  return nil if size > 9

  basis = %w[1 2 3 4 5 6 7 8 9]
  basis.slice(0...size)
       .permutation
       .map { |p| p.inject(:+).to_i }
end

prime_pandigitals = (2..9).map do |i|
  get_all_pandigitals(i).filter(&:prime?)
end

puts "ans: #{prime_pandigitals.flatten.max}"
