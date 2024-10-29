lychrel = []

(1..10000).each do |number|
  iterations = 1
  n = number + number.to_s.reverse.to_i
  while !(n.to_s.reverse.eql?(n.to_s) ) && (iterations < 50 )
    n = n + n.to_s.reverse.to_i
    iterations +=1    
  end
  lychrel.append(number) unless n.to_s.reverse.eql?(n.to_s)
end

p lychrel.count