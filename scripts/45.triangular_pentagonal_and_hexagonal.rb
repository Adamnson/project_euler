require_relative "../helpers/special_helper"

hpt = (1..1_000_000).map(&:hexagon)
                    .map { |hex| [hex.pentagon_idx, hex.triangle_idx] }
                    .map(&:compact)
                    .filter { |arr| arr.size.eql?(2) }
p hpt

p "ans: #{31_977.pentagon}"
