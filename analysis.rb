require "rainbow"
require "rainbow/refinement"

# puts `ruby run_all.rb :out => ./scripts/out.md`
run_times = File.read("./scripts/time.md").split("\n").map(&:strip).map(&:to_f).map { |el| el.round(2) }

puts "Total run time: #{Rainbow(run_times.inject(:+).round(2).to_s).royalblue}"
puts "Max is for solution #{run_times.index(run_times.max)} at " + Rainbow(run_times.max.to_s).orangered
start = 0
puts("_" * 34)
puts Rainbow("|Sr. No. |#{format('%9s', 'Time')} | Cummulative|").underline.inverse.bright

while start < run_times.size
  time = Rainbow(format("%7.2f", run_times.slice(start, 10).inject(:+).to_s)).blueviolet
  partial_sum = Rainbow(format("%10.2f", run_times[..(start + 10)].inject(:+).to_s)).dodgerblue
  puts  "|#{format('%02d', start)} - #{format('%02d', (start + 10))} |  #{time} | #{partial_sum} |"
  start += 10
end
puts Rainbow(" " * 34).inverse.faint.underline
