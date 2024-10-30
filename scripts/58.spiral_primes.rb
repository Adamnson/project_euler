require_relative "../helpers/helper"
#check 28 for explationation of diagnoal terms

#bottom right is n**2 for odd nos in 
#bottom left is n**2 - (n-1)
#top left is n** - 2


#GENERAL
# seq = (1..7).filter {|n| n.odd?}
# diagonal = []

# puts "bottom right : #{seq.map{|el| el.pow(2)}}"
# puts "bottom left : #{seq.map{|el| el.pow(2) - (el-1)}}"
# puts "top left : #{seq.map{|el| el.pow(2) - 2*(el-1)}}"
# puts "top right : #{seq.map{|el| el.pow(2) - 3*(el-1)}}"
#GENERAL

#one
# ratio = 1.0
# n = 2000
# while n<5000
#   seq = (1..n).filter(&:odd?)
#   diagonal.append(seq.map{|el| el.pow(2)})
#   diagonal.append(seq.map{|el| el.pow(2) - (el-1)})
#   diagonal.append(seq.map{|el| el.pow(2) - 2*(el-1)})
#   diagonal.append(seq.map{|el| el.pow(2) - 3*(el-1)})

#   diagonal = diagonal.flatten.uniq!
#   #puts "primes: #{diagonal.filter(&:prime?)}"
#   #puts "diag : #{diagonal}"
#   #puts "[ #{diagonal.filter(&:prime?).size.to_f} ,#{ diagonal.size}]"
#   ratio = diagonal.filter(&:prime?).size.to_f / diagonal.size
#   p [n, ratio] 
#   break if ratio < 0.1
#   n +=1
  
# end

#[26590, 0.1000056415367546]
#[26591, 0.09999811962919088]

#TWO UNCOMMENT THIS =BEGIN
populate_diagonal = lambda {|limit|
  arr = []
  seq = (1..limit).filter(&:odd?)
  arr.append(seq.map{|el| el.pow(2)})
  arr.append(seq.map{|el| el.pow(2) - (el-1)})
  arr.append(seq.map{|el| el.pow(2) - 2*(el-1)})
  arr.append(seq.map{|el| el.pow(2) - 3*(el-1)})
  arr.flatten.uniq!
}

t0=Time.now
(26200..26300).to_a.filter(&:odd?).map {|num| [num, populate_diagonal.call(num)]}
.map {|el| [el.first, el.last.filter(&:prime?).size, el.last.size,]}
.map {|arr| arr.append(arr[1].to_f/arr.last)}
.filter {|el| el.last < 0.1}
.map {|el| p el} 
puts Time.now-t0
#UNTIL HERE =END

