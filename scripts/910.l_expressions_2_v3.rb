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

n1 = Node.new(5)
n1.show

n2 = Node.new("S", 0)
n2.show

n3 = Node.new("Z","A","0")
n3.show
