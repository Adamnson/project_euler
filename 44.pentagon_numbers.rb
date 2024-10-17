require "./special_helper"

pent_arr = (1..1000).map { |i| pentagon.call(i) }

j_k = pent_arr.product(pent_arr)
              .map { |pair| [pair[0] + pair[1], (pair[0] - pair[1]).abs] }
              .map { |arr| [inv_pentagon.call(arr[0]), inv_pentagon.call(arr[1])] }
              .map(&:compact)
              .reject { |el| el.nil? || el.empty? } # this results in arrays which contains j or k indices
              .filter { |arr| arr.size.eql?(2) } # searching for the array which contains both j & k

p j_k
