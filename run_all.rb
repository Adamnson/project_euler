(1...10).each do |i|
  puts "running #{i}"
  puts `ruby 0#{i}*.rb`
end

(10...20).each do |i|
  puts "running #{i}"
  puts `ruby #{i}*.rb`
end

(20...30).each do |i|
  unless [26, 27].include?(i)
    puts "running #{i}"
    puts `ruby #{i}*.rb`
  end
end

(30...40).each do |i|
  unless [31, 32, 38, 39].include?(i)
    puts "running #{i}"
    puts `ruby #{i}*.rb`
  end
end
