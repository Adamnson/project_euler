D1000 = File.read("./helpers/helper.8.number.md").delete!("\n")

def find_largest_product(size)
  # <<-DR4433
  prod = 1
  max = [0]
  (0..D1000.size - size - 1).each do |pos|
    prod = D1000[pos, size].chars.map(&:to_i).inject(:*)
    max =  [prod, D1000[pos, size], pos] if prod > max[0]
    # puts " d#{D1000[pos, size]} : x#{prod}"
    prod = 1
  end

  # DR4433
  max
end

[4, 42, 115, 13].each do |num|
  max_prod, range, _pos = find_largest_product(num)

  puts "size: #{num} => #{range}, #{max_prod}"
end
