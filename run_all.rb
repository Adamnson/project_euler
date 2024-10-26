Dir.chdir("./scripts/")

(1...10).each do |i|
  t0 = Time.now
  puts `ruby 0#{i}*.rb :out => out.md`
  print "#{i} }%{ success!"
  text = "#{Time.now - t0} \n"
  File.write("time.md", text, mode: "a")
end

(10...50).each do |i|
  next if [26, 31].include?(i)

  t0 = Time.now
  puts `ruby #{i}*.rb :out => out.md`
  print "#{i}}%{ success!"
  text = "#{Time.now - t0} \n"
  File.write("time.md", text, mode: "a")
end

# (20...30).each do |i|
#   unless [26].include?(i)
#     puts "running #{i}"
#     puts `ruby #{i}*.rb`
#   end
# end

# (30...40).each do |i|
#   unless [31].include?(i)
#     puts "running #{i}"
#     puts `ruby #{i}*.rb`
#   end
# end

# (40...50).each do |i|
#   puts "running #{i}"
#   puts `ruby #{i}*.rb`
# end
