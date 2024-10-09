commons = []
specials = []

(1...100).each do |p|
  (1...100).each do |q|
    commons = p.to_s.chars.filter { |digit_p| q.to_s.chars.include?(digit_p) }.uniq
    p_dash = (p.to_s.chars - commons).inject(:+).to_i
    q_dash = (q.to_s.chars - commons).inject(:+).to_i
    reduced_frac = (!p_dash.zero? or q_dash.zero?) ? p_dash.to_f / q_dash : 1.0
    if reduced_frac < 1 and !commons.empty? # rubocop:disable Style/Next
      # puts "p: #{p} p': #{p_dash} q: #{q} q': #{q_dash} common set: #{commons} , frac : #{reduced_frac}"
      original_to_new_ratio = (p.to_f / q.to_f) / reduced_frac
      # p "pq/p'q' : #{original_to_new_ratio}"
      specials.append([p, q]) if original_to_new_ratio.eql?(1.0)
    end
    # specials.append([p, q]) if ((p.to_f / q) / reduced_frac).eql?(1)
  end
end
p specials

specials = specials.filter { |nums| nums[0] % 10 != 0 }
p specials

specials = specials.map { |nums| nums[0].to_f / nums[1] }

p specials

p specials.inject(:*).round(3)
