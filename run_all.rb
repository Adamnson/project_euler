require "rainbow/refinement"

Dir.chdir("./scripts/")

(1..50).each do |i|
  next if [26, 31].include?(i)

  t0 = Time.now
  if (1...10).include?(i)
    puts `ruby 0#{i}*.rb :out => out.md`
  else
    puts `ruby #{i}*.rb :out => out.md`
  end
  print i.to_s + Rainbow(" }%{ ").deeppink + Rainbow("success!").springgreen
  text = "#{Time.now - t0} \n"
  File.write("time.md", text, mode: "a")
end
puts
