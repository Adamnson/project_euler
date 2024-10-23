(1...10).each do |i|
  puts "running #{i}"
  puts `ruby scripts/0#{i}*.rb`
end

(10...20).each do |i|
  puts "running #{i}"
  puts `ruby scripts/#{i}*.rb`
end

(20...30).each do |i|
  unless [26].include?(i)
    puts "running #{i}"
    puts `ruby scripts/#{i}*.rb`
  end
end

(30...40).each do |i|
  unless [31, 39].include?(i)
    puts "running #{i}"
    puts `ruby scripts/#{i}*.rb`
  end
end
