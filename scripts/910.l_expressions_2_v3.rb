require "rainbow"
# class Node
#  @operator : Classifies the operation to be performed A/Z/S
#  @params : hash that contains {u,v,w depending on operator}
#  #initialize : initializes a node with n parameters and correct operator
#  #transform : applies the transfomation as per the operator
class Node
  attr_accessor :operator, :params

  def initialize(u = 0, v = nil, w = nil)
    @params = {}
    @params[:u] = u
    @params[:v] = v unless v.nil?
    @params[:w] = w unless w.nil?

    @operator = assign_operator
  end

  def assign_operator
    case @params.size
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
      { new_expression: "#{@params[:v]}(#{@params[:u]}(#{@params[:v]})(#{params[:w]}))",
        to_queue: false }
    when "A"
      if (@params[:u].ord >= 48) && (@params[:u].ord <= 57)
        { new_expression: ((@params[:u]).to_i + 1), to_queue: false }
      else
        puts "creating a new expression for #{@params[:u]}"
        { new_expression: @params[:u], for_queue: "A", to_queue: true }
      end
    when "Z"
      { new_expression: @params[:v], to_queue: false }
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

# class Expression
# accepts an expression as an input
# @value :
# @identified_operator :
# @node :
# @queue :
# @required_params :
# @file :
# @solved_internal_expression :
# #initialize
# #identify_start : identifies the start of the expression
# #identify_params : depending on the start of the expression, identifies "n" params
# #format : core logic of Expression.
#           1) initializes @node after #identify_params
#           2) calls Node#transform
#           3) updates @queue
#           4) re-initizlizes Express with transformed values and updated queue
# #update_value
# #print_deets
# #solve
#
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
    puts "to initialize with #{exp} #{"and #{operator_to_enqueue}" unless operator_to_enqueue.nil?}"
    @value = exp
    @queue = []
    @tail = ""
    @queue.push(operator_to_enqueue) unless operator_to_enqueue.nil? || operator_to_enqueue.empty?
    identify_start
    add_step
    # print_deets
  end

  def add_step
    puts "tails is #{@tail}"
    print_string = "#{"#{queue} -> " unless queue.empty?}" + "#{@value}" + "#{"---#{@tail}" unless @tail.empty?}"
    puts "adding #{print_string}"
    puts `echo "#{print_string}" >> 910_exp.txt`
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
    else
      @identified_operator = ""
      @required_params = 0
    end
  end

  def identify_params
    number_of_open_brackets = 0
    skip_1_char = false
    buffer = ""
    params = []
    @tail = ""
    @value.chars.each_with_index do |ch, idx|
      number_of_open_brackets += 1 if ch == "("
      number_of_open_brackets -= 1 if ch == ")"
      if number_of_open_brackets.zero? && idx.positive?
        params.append(buffer)
        puts Rainbow("currently: #{params} marked at #{@required_params}").color(:forestgreen)
        if params.size == @required_params
          @tail = @value[(idx + 1)..]
          puts "i think the tail is #{@tail} from #{idx + 1} onwards" unless @tail.empty?
          return params
        end

        # check if it is a number and break the  format loop

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
    return if @this_is_the_end

    @node = Node.new(*identify_params)
    recveived_from_tranform = @node.transform
    puts "received from transform #{recveived_from_tranform}"
    if recveived_from_tranform[:to_queue]
      puts "this should be true #{recveived_from_tranform[:to_queue]}"
      if @queue.empty?
        @queue = recveived_from_tranform[:for_queue]
      else
        @queue.push(recveived_from_tranform[:for_queue])
      end
    end
    value_for_init = if @tail.empty?
                       recveived_from_tranform[:new_expression]
                     else
                       (recveived_from_tranform[:new_expression]).to_s + @tail
                     end
    # initialize(recveived_from_tranform[:new_expression], *@queue)
    initialize(value_for_init, *@queue)
    puts "printing from format  #{@value}"
    return unless @value.to_i.eql?(@value.to_i) && @queue.empty?
    return unless (@value.ord >= 48 && @value.ord <= 57) || (@value.ord > 0 && @value.ord <= 9)

    @this_is_the_end = true
    puts "the value has been identified as #{@value}"
  end

  def update_value
    initialize("#{@queue.last}(#{@value})", @queue.slice(..-2))
  end

  def print_deets
    puts "Here's what I know"
    puts("===>Value #{@value}")
    puts("===>prev iteration node #{@node}")
    puts("===>identified opeator #{@identified_operator}")
    puts("===>reqd params #{@required_params}")
    puts("===>operations in queue #{@queue}")
  end

  def solve
    format
    return unless (@value.ord >= 48 && @value.ord <= 57) || (@value.ord > 0 && @value.ord <= 9)

    @solved_internal_expression = true
    update_value
    puts "solved"
    print_deets
  end
end

# sza0 = Expression.new("S(Z)(A)(0)")
# 4.times do
#   sza0.solve
# end

azz0 = Expression.new("A(Z(Z)(0))")
4.times do
  azz0.solve
end

# s5za0 = Expression.new("S(S)(S(S))(S(Z))(A)(0)")
# 3.times do
#   s5za0.solve
# end

# puts "format 1"
# sza0.format
# puts "value check"
# puts sza0.value
# puts "identifying again"
# puts sza0.identify_params
# puts "formating A expression"
# sza0.format
# puts "processing Z expression"
# sza0.format
# puts "for the last time"
# sza0.format

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
