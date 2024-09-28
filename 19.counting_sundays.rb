require("date")

puts "sanity check: 1-jan-1900 was monday? #{Date.new(1900, 1, 1).monday?}"

start_date = Date.new(1901, 1, 1)
end_date = Date.new(2000, 12, 31)
date_itr = start_date
sunday_count = 0

while date_itr < end_date
  sunday_count += 1 if date_itr.sunday?
  date_itr >>= 1
end

puts sunday_count
