require "./special_helper"

pent_arr = (1..1000).map(&:pentagon)

j_k = pent_arr.product(pent_arr)
              .map { |pair| [pair[0] + pair[1], (pair[0] - pair[1]).abs] }
              .map { |arr| [arr[0].pentagon_idx, arr[1].pentagon_idx] }
              .map(&:compact)
              .reject { |el| el.nil? || el.empty? } # this results in arrays which contains j or k indices
              .filter { |arr| arr.size.eql?(2) } # searching for the array which contains both j & k

p j_k
