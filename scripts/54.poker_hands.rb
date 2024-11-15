games = File.read("../helpers/helper.54.poker_hands.txt").split("\n")
# p games

# read the string
# extract the cards for each player
# compute the name/score of the hand
# compare the scores, decide winner
test2 = "TD JD QD 9D AD 2C 5C 7D 8S QH"

get_hands = lambda { |game_string|
  [game_string.split[..4], game_string.split[5..]]
}
player1, player2 = get_hands.call(test2)
p player1, player2

# values = player1.map {|card| card[0]}
# suits = player1.map {|card| card[1]}
# p values, suits

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

# val2 = player2.map {|card| card[0]}
# p normalise.call(val2)

check_straight = lambda { |vals|
  highCard = 0
  ret_val = false
  vals_n =  normalise.call(vals).map { |el| el.eql?("A") ? "0" : el.to_i }
  if vals_n.include?("0")
    vals_n.reject { |el| el.eql?("0") }
    if (1..5).map { |num| vals_n.append(1).include?(num) }.all?
      ret_val = true
      highCard = 1
    elsif (10..14).map { |num| vals_n.append(14).include?(num) }.all?
      ret_val = true
      highCard = 10
    end
  else
    ret_val = (2..13).to_a.slice(vals_n.min - 2, 5).map { |num| vals_n.include?(num) }.all?
    highCard = vals.min if ret_val
  end
  [ret_val, highCard]
}

p check_straight.call(player1.map { |card| card[0] })
get_score = lambda { |hand|
  values = hand.map { |card| card[0] }
  suits = hand.map { |card| card[1] }
  straight = check_straight.call(values)
  flush = suits.uniq.one?
  # royal = %w[T J Q K A].map {|face| values.include?(face)}.all?
  fourOfaKind = values.filter { |val| values.count(val).eql?(4) }.uniq
  threeOfaKind = values.filter { |val| values.count(val).eql?(3) }.uniq
  pair = values.filter { |val| values.count(val).eql?(2) }.uniq

  score = 1 # highCard
  highCard = values.include?("A") ? "14" : normalise.call(values).map(&:to_i).max
  if straight.first
    if flush
      score = 10 if straight.last.eql?(10) # royalFlush starts with 10
      score = 9
    end
    score = 5
    highCard = straight.last
  elsif flush
    score = 6
  end

  unless score > 1
    if fourOfaKind.one?
      score = 8
      highCard = fourOfaKind.first
    elsif threeOfaKind.one? and pair.one?
      score = 7
      highCard = [threeOfaKind.first, pair.first]
    elsif threeOfaKind.one?
      score = 4
      highCard = threeOfaKind.first
    elsif pair.size.eql?(2)
      score = 3
      highCard = pair.sort
    elsif pair.one?
      score = 2
      highCard = pair.first.eql?("A") ? "14" : normalise.call(pair).first
    end
  end
  [score, highCard]

  # puts "pair?: #{pair}"
  # puts "3oK?: #{threeOfaKind}"
  # puts "FH?: #{pair.one? && threeOfaKind.one?}"
  # puts "4oK?: #{fourOfaKind}"
  # puts "flush: #{flush}"
  # puts "straight: #{straight.call(values)}"
  # puts "straightFlush: #{straight.call(values) && flush}"
  # puts "royalFlush: #{straight.call(values) && flush && royal}"
}

# 1  highcard       #value
# 2-pair           #value, count
# 3-twoPair
# 4-threeOfaKind   #value
# 5-straight       #value(start)
# 6-flush          #value(opt)
# 7-fullHouse
# 8-fourOfaKind    #value
# 9-straightFlush
# 10-royalFlush

p get_score.call(player1)
p get_score.call(player2)

w1 = w2 = incl = 0
games.each do |game|
  p1, p2 = get_hands.call(game)
  s1 = get_score.call(p1)
  s2 = get_score.call(p2)
  w1 += 1 if s1.first > s2.first
  w2 += 1 if s2.first > s1.first
  next unless s1.first.eql?(s2.first)

   tie_breaker = s1.last.to_i <=> s2.last.to_i
  w1 += 1 if tie_breaker.positive?
  w2 += 1 if tie_breaker.negative?
  next unless tie_breaker == 0

   puts "confict #{incl}"
   puts "p1: #{p1}"
   puts "p2: #{p2}"
   p [s1, s2]
   incl += 1
end

p [w1, w2, incl]
# [366, 247, 387]
