require "./special_helper"

j_k = lambda { |low, high|
  (low..high).map(&:pentagon)
             .permutation(2) # .product(pent_arr)
             .map { |pair| [pair[0] + pair[1], (pair[0] - pair[1]).abs] }
             .map { |arr| [arr[0].pentagon_idx, arr[1].pentagon_idx] }
             .map(&:compact)
             .reject { |el| el.nil? || el.empty? } # this results in arrays which contains j or k indices
             .filter { |arr| arr.size.eql?(2) } # searching for the array which contains both j & k
}

start = 100_000
interval_length = 2000
while start < 150_000
  puts " #{start} - #{start + interval_length} : #{j_k.call(start, start + interval_length)}"
  start += interval_length
end
