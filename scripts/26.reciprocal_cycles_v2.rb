require "colorize"
DENOMINATOR_LENGTH = 100
# class Reciprocal
# @num : an integer for which the reciprocal is calculated
# @denominator : the sequence obtained by calculating 10^n/ @num
# @sequence: identified repeating sequence in a non-terminatin @denominator
# truncate_zeros : removes the trailing zeros in terminating sequences
class Reciprocal
  attr_accessor :num, :denominator, :sequence, :offset

  def initialize(number)
    @num = number
    @denominator = ""
    @offset = ""
    @sequence = ""
  end

  def find_denominator
    @denominator = (1..DENOMINATOR_LENGTH).to_a.map { |n| (10.pow(n) / @num).modulo(10).to_s }.inject(:+)
    truncate_zeros
    split_repeating_and_not_repeating
  end

  def truncate_zeros
    puts "denominator not found" if @denominator.empty?

    parts = @denominator.partition "0"
    p parts
    @denominator = parts.first if parts.last.chars.all? "0"
  end

  def split_repeating_and_not_repeating
    if @denominator.length < DENOMINATOR_LENGTH
      @offset = @sequence = nil
      return
    end
    puts "might have repeating sequence"

    check_single_offset_repetition
  end

  def check_single_offset_repetition
    parts = @denominator.partition(@denominator[0])
    @sequence = parts.last.chars.all?(parts.last[0]) ? parts.last[0] : nil
    return if @sequence.nil?

    @offset = parts[1].eql?(@sequence) ? "" : parts[1]
  end
end

(2..20).each do |denominator|
  temp = Reciprocal.new(denominator)
  temp.find_denominator
  if temp.sequence.nil?
    puts "calc: #{temp.num} : 0.#{temp.denominator}".colorize(:green)
  else
    puts "calc: #{temp.num} :" + " 0.#{temp.offset}(#{temp.sequence})".colorize(:red)
  end
end
