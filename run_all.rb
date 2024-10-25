Dir.chdir("./scripts/")

(1...10).each do |i|
  puts "running #{i}"
  puts `ruby 0#{i}*.rb`
end

(10...20).each do |i|
  puts "running #{i}"
  puts `ruby #{i}*.rb`
end

(20...30).each do |i|
  unless [26].include?(i)
    puts "running #{i}"
    puts `ruby #{i}*.rb`
  end
end

(30...40).each do |i|
  unless [31].include?(i)
    puts "running #{i}"
    puts `ruby #{i}*.rb`
  end
end

(40...50).each do |i|
  puts "running #{i}"
  puts `ruby #{i}*.rb`
end
