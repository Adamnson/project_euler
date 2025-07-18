class Node
  attr_accessor :operator, :params

  def initialize(u = 0, v = nil, w = nil)
    @params = {}
    @params[:u] = u
    @params[:v] = v unless v.nil?
    @params[:w] = w unless w.nil?

    @operator = case @params.size
                when 1
                  "A"
                when 2
                  "Z"
                when 3
                  "S"
                else
                  nil
                end
  end

  def transform
    case @operator
    when "S"
      {:new_expression=>"#{@params[:v]}(#{params[:u]}(#{params[:v]})(#{params[:w]}))",
      :to_queue=>false}
    when "A"
      if (@params[:u][0].ord >= 48) && (@params[:u][0].ord <= 57)
        (@params[:u]).to_i + 1
        {:new_expression=>((@params[:u]).to_i + 1), :to_queue=>false}
      else
        puts "creating a new expression for #{@params[:u]}"
        {:new_expression=>@params[:u], :for_queue=> "A", :to_queue=>true}
      end
    when "Z"
        {:new_expression=>@params[:v], :to_queue=>false}
    end
  end

  def show
    case @operator
    when "A"
      puts "A(#{@params[:u]})"
    when "Z"
      puts "Z(#{@params[:u]})(#{@params[:v]})"
    when "S"
      puts "S(#{@params[:u]})(#{@params[:v]})(#{@params[:w]})"
    else
      puts "Expression error"
    end
  end
end

class Expression
  attr_accessor :node, :value, :queue

  @value = ""
  @node = nil
  @identified_operator = ""
  @required_params = 0
  @solved_internal_expression = false
  @file = "910_exp.txt"
  File.new(@file, "w")

  def initialize(exp, operator_to_enqueue = nil)

    puts "to initialize with #{exp} and #{operator_to_enqueue}"
    @value = exp
    @queue = []
    @queue.push(operator_to_enqueue) unless (operator_to_enqueue.nil? || operator_to_enqueue.empty?)
    identify_start
    add_setp
    print_deets
  end

  def add_setp
    if @queue.empty?
      puts `echo "#{@value}" >> 910_exp.txt`
    else
      puts `echo "#{@queue} -> #{@value}" >> 910_exp.txt`
    end
  end

  def identify_start
    case @value[0]
    when "A"
      @identified_operator = "A"
      @required_params = 1
    when "Z"
      @identified_operator = "Z"
      @required_params = 2
    when "S"
      @identified_operator = "S"
      @required_params = 3
    end
  end

  def identify_params
    number_of_open_brackets = 0
    skip_1_char = false
    buffer = ""
    params = []
    @value.chars.each_with_index do |ch, idx|
      number_of_open_brackets += 1 if ch == "("
      number_of_open_brackets -= 1 if ch == ")"
      if number_of_open_brackets.zero? && idx.positive?
        params.append(buffer)
        return params if params.size == @required_params

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

  def format
    @node = Node.new(*identify_params)
    recveived_from_tranform = @node.transform
    puts "received from transform #{recveived_from_tranform}"
    if (recveived_from_tranform[:to_queue] )
      puts "this should be true #{recveived_from_tranform[:to_queue]}"
      if (@queue.empty?) 
        @queue = recveived_from_tranform[:for_queue]
      else
        @queue.push(recveived_from_tranform[:for_queue])
      end
    end
    initialize(recveived_from_tranform[:new_expression], *@queue)
    puts "printing from format  #{@value}"
    if @value.ord >= 48 && @value.ord <=57
      @solved_internal_expression = true
      update_value
      puts "solved"
      print_deets
    end

    def update_value
      initialize("#{@queue.last}(#{@value})", @queue.slice(..-2))
    end
  end

  def print_deets
    puts "Here's what I know"
    puts("===>Value #{@value}")
    puts("===>prev iteration node #{@node}")
    puts("===>identified opeator #{@identified_operator}")
    puts("===>reqd params #{@required_params}")
    puts("===>operations in queue #{@queue}")
  end
end

sza0 = Expression.new("S(Z)(A)(0)")
p "params"
puts sza0.identify_params
puts "format 1"
sza0.format
puts "value check"
puts sza0.value
puts "identifying again"
puts sza0.identify_params
puts "formating A expression"
sza0.format
puts "processing Z expression"
sza0.format
puts "for the last time"
sza0.format
# p "printing nodes"
# puts sza0.node
# p "node params"
# puts sza0.node.params
# sza0.node.show
# p "on transformation"
# puts sza0.node.transform

# a0 = Expression.new("A(0)")
# puts a0.identify_params(1)
# # puts sza0.params

# a0_node = Node.new(0)
# puts "Created new node"
# a0_node.show()

# sza0_nodes = Node.new('Z', 'A', '0')
# puts "SZA nodes"
# sza0_nodes.show
# puts "operator : #{sza0_nodes.operator}"
# puts "params: #{sza0_nodes.params}"
