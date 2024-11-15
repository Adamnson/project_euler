require_relative "../helpers/helper"

puts (1..100).to_a.product((1..100).to_a).map { |pair| sum_of_digits(pair.first.pow(pair.last)) }.max
