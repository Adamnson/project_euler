class Reciprocal
  attr_accessor :num, :denominator, :sequence

  def initialize(number)
    @num = number
    @denominator = ""
    @sequence = ""
  end

  def find_denominator
    (1..100).each do |i|
      char = ((10.pow(i) / @num)).modulo(10).to_s
      @denominator += char.to_s
      truncate_zeros
      split_repeating_and_not_repeating
    end
  end

  def truncate_zeros
    puts "denominator not found" if @denominator.empty?

    parts = @denominator.partition "0"
    @denominator = parts.first if parts.last.chars.all? "0"
  end

  def split_repeating_and_not_repeating
    if @denominator.length < 100
      @sequence = nil
      return 
    end
    
    puts "might have repeating sequence"
  end
end

(2..10).each do |denominator|
  temp = Reciprocal.new(denominator)
  temp.find_denominator
  puts "calc: #{temp.num} : 0.#{temp.denominator}"
end
