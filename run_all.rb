(1...10).each do |i|
  puts "running #{i}"
  puts `ruby 0#{i}*.rb`
end

(10...20).each do |i|
  unless i.eql?(12)
    puts "running #{i}"
    puts `ruby #{i}*.rb`
  end
end

(20...30).each do |i|
  unless [26, 27].include?(i)
    puts "running #{i}"
    puts `ruby #{i}*.rb`
  end
end