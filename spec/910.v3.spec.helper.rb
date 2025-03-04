require_relative "../scripts/910.l_expressions_2_v3"

describe Node do
  describe "automatic operator assignment" do
    it "creates an A expression when only one parameter is supplied" do
      n = Node.new(5)
      expect(n.params).to eql({:u=>5})
      expect(n.operator).to eql("A")
    end
   
    it "creates a Z expression when two parameters are supplied" do
      n = Node.new(7,11)
      expect(n.params).to eql({:u=>7,:v=>11})
      expect(n.operator).to eql("Z")
    end

    it "creates a S expression when three parametes are supplied" do
      n = Node.new(7,2,6)
      expect(n.params).to eql({:u=>7,:v=>2,:w=>6})
      expect(n.operator).to eql("S")
    end

    it "creates an A(0) expression when no parameters are supplied" do
      n = Node.new
      expect(n.params).to eql({:u=>0})
      expect(n.operator).to eql("A")
    end
  end
end
