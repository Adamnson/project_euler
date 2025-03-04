class Node
  attr_accessor  :operator, :params

  def initialize(u = 0, v = nil, w = nil)
    @params = {}
    @params[:u] = u
    @params[:v] = v unless v.nil?
    @params[:w] = w unless w.nil?

    case  @params.size
    when 1
      @operator = "A"
    when 2
      @operator = "Z"
    when 3
      @operator = "S"
    else
      @operator = nil
    end
  end

  def show
    if @operator.eql? "A"
      puts "A(#{@params[:u]})"
    elsif @operator.eql? "Z"
      puts "Z(#{@params[:u]})(#{@params[:v]})"
    elsif @operator.eql? "S"
      puts "S(#{@params[:u]})(#{@params[:v]})(#{@params[:w]})"
    else
      puts "Expression error"
    end
  end
end

class Expression
  @value = ""
  def initialize(exp)
    @value = exp
  end
  
  def identify_params(num = 3)
    number_of_open_brackets = 0
    skip_1_char = false
    buffer = ""
    params = []
    @value.chars.each_with_index do |ch, idx|
      number_of_open_brackets += 1 if ch == '('
      number_of_open_brackets -= 1 if ch == ')'
      if number_of_open_brackets.zero? and idx.positive?
        params.append(buffer)
        return params if params.size == num

        buffer = ""
        skip_1_char = true
        next
      end
      if skip_1_char 
        skip_1_char = false
        next
      end
      buffer += ch if idx > 1
    end
  end
end


sza0 = Expression.new("S(Z)(A)(0)")
puts sza0.identify_params
