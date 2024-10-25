require_relative "../helpers/helper"

puts 23.C(10)
count = 0
(1..100).each do |n|
  (0..n).each do |r|
    count += 1 if n.C(r) > 1_000_000
  end
end

puts count
