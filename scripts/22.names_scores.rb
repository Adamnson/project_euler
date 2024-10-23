NAMES = File.read("./helpers/helper.22_names.txt").split(",").map { |e| e.gsub('"', "") }.sort

sum = 0
puts NAMES[937]
NAMES.each_with_index do |name, idx|
  worth = name.bytes.map { |ch| ch - 64 }.inject(:+)
  sum += worth * (idx + 1)
end

puts sum
