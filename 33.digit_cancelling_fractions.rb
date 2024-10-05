commons = []
specials = []

(1...100).each do |p|
  (1...100).each do |q|
    commons = p.to_s.chars.filter { |digit_p| q.to_s.chars.include?(digit_p) }
    p_dash = (p.to_s.chars - commons).inject(:+).to_i
    q_dash = (q.to_s.chars - commons).inject(:+).to_i

    puts "p: #{p} p': #{p_dash} q: #{q} q': #{q_dash} common set: #{commons} "
  end
end
