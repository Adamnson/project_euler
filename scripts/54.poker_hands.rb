games = File.read("../helpers/helper.54.poker_hands.txt").split("\n")
# p games

# read the string
# extract the cards for each player
# compute the name/score of the hand 
# compare the scores, decide winner

test1 = "5H 7C 8S 6S 4D 2C 3S 8S 8D TD"
test2 = "TD JD QD 9D AD 2C 5C 7D 8S QH"
test3 = "2D 9C AS AH AC 3D 6D 7D TD QD"
test4 = "4D 6S 9H QH QC 3D 6D 7H QD QS"
test5 = "2H 2D 4C 4D 4S 3C 3D 3S 9S 9D"

get_hands = lambda {|game_string|
 [game_string.split[..4], game_string.split[5..]]
}
player1, player2 = get_hands.call(test2)
p player1, player2

values = player1.map {|card| card[0]}
suits = player1.map {|card| card[1]}

p values, suits
normalise = lambda { |vals|
  ret_val = []  
  vals.each do |v|
    if %w[K Q J T].include?(v)
      case v
      when "T"
        v = "10"
      when "J"
        v = "11"
      when "Q"
        v = "12"
      when "K"
        v = "13"
      end
    end
    ret_val.append(v) 
  end
ret_val
}

check_straight = lambda {|vals|
vals_n =  normalise.call(vals).map {|el|   el.eql?("A") ? "0" : el.to_i}
if vals_n.include?("0")
  strip_ace = vals_n.reject{|el| el.eql?("0")}
  (1..5).map{|num| vals_n.append(1).include?(num)}.all? || (10..14).map{|num| vals_n.append(14).include?(num)}.all?
else
  ((2..13).to_a.slice(vals_n.min - 2,5)).map{|num| vals_n.include?(num)}.all?
end
}


get_score = lambda {|hand|
  values = hand.map {|card| card[0]}
  suits = hand.map {|card| card[1]}
  straight = check_straight.call(values)
  flush = suits.uniq.one?
  royal = %w[T J Q K A].map {|face| values.include?(face)}.all?
  fourOfaKind = values.filter{|val| values.count(val).eql?(4)}.uniq.one?
  threeOfaKind = values.filter{|val| values.count(val).eql?(3)}.uniq  
  pair = values.filter{|val| values.count(val).eql?(2)}.uniq

  score = 1 # highCard
  if straight
    if flush
      if royal
        score = 10
      end
      score = 9
    end
    score = 5
  elsif flush
    score = 6
  end

  unless score>1
    score = 8 if fourOfaKind
    score = 7 if threeOfaKind and pair
    score = 4 if threeOfaKind
    score = 3 if pair.size.eql?(2)
    score = 2 if pair.one?
  end
  score

# puts "pair?: #{pair}"
# puts "3oK?: #{threeOfaKind}"
# puts "FH?: #{pair.one? && threeOfaKind.one?}"
# puts "4oK?: #{fourOfaKind}"
# puts "flush: #{flush}"
# puts "straight: #{straight.call(values)}"
# puts "straightFlush: #{straight.call(values) && flush}"
# puts "royalFlush: #{straight.call(values) && flush && royal}"
}


puts get_score.call(player1)
puts get_score.call(player2)


# val2 = player2.map {|card| card[0]}
# p normalise.call(val2)

#1  highcard       #value
#2-pair           #value, count
#3-twoPair
#4-threeOfaKind   #value
#5-straight       #value(start)
#6-flush          #value(opt)
#7-fullHouse
#8-fourOfaKind    #value
#9-straightFlush
#10-royalFlush

w1=w2=incl=0
games.each do |game|
  p1, p2 = get_hands.call(game)
  s1 = get_score.call(p1)
  s2 = get_score.call(p2)
  w1 += 1 if s1 > s2
  w2 += 1 if s2 > s1
  incl += 1 if s1.eql?(s2)
end

p [w1,w2,incl]
#[366, 247, 387]