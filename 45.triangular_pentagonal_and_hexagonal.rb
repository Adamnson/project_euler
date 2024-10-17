require "./special_helper"

commons = (000_000..50_000).map { |num| [num.hexagon_idx, num.pentagon_idx, num.triangle_idx] }
                           .map(&:compact)
                           .reject(&:empty?)
                           .filter { |arr| arr.size.eql?(3) }

p commons

commons.each do |hpt|
  p [hpt, hpt[0].to_i.hexagon, hpt[1].to_i.pentagon, hpt[2].to_i.triangle]
end
