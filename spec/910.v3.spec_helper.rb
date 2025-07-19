require_relative "../scripts/910.l_expressions_2_v3"

describe Node do
  describe "automatic operator assignment" do
    it "creates an A expression when only one parameter is supplied" do
      n = Node.new(5)
      expect(n.params).to eql({ u: 5 })
      expect(n.operator).to eql("A")
    end

    it "creates a Z expression when two parameters are supplied" do
      n = Node.new(7, 11)
      expect(n.params).to eql({ u: 7, v: 11 })
      expect(n.operator).to eql("Z")
    end

    it "creates a S expression when three parametes are supplied" do
      n = Node.new(7, 2, 6)
      expect(n.params).to eql({ u: 7, v: 2, w: 6 })
      expect(n.operator).to eql("S")
    end

    it "creates an A(0) expression when no parameters are supplied" do
      n = Node.new
      expect(n.params).to eql({ u: 0 })
      expect(n.operator).to eql("A")
    end
  end

  describe "check transformation for A operator" do
    it "increments the value by 1 if the parameter is a number (PASSED AS STRING), to_queue flag is false" do
      output_hashes = (0..10_000).to_a.map { |i| Node.new(i.to_s) } # need to pass strings NOT INTEGERS
                                 .map(&:transform)
      output_hashes.map { |out| expect(out).to have_key(:new_expression) }
      output_hashes.map { |out| expect(out).to have_key(:to_queue) }
      output_hashes.map { |out| expect(out).not_to have_key(:for_queue) }
      expect(output_hashes).to match_array((1..10_001).to_a.map { |n| { new_expression: n, to_queue: false } })
    end

    it "passes the parameter to create a new expression, adds 'A' to queue, to_queue flag is true" do
      test_expressions = ["A(0)", "Z(S)(0)", "S(1)(Z)(2)"]
      test_expressions.each do |exp|
        n = Node.new(exp)
        output_hash = n.transform
        expect(n.operator).to eql("A")
        expect(output_hash).to have_key(:new_expression)
        expect(output_hash).to have_key(:to_queue)
        expect(output_hash).to have_key(:for_queue)
        expect(output_hash).to eql({ new_expression: exp, to_queue: true, for_queue: "A" })
      end
    end
  end

  describe "check transformation for Z operator" do
    it "returns the second parameter, to queue flag is false" do
      n = Node.new("A", "0")
      output_hash = n.transform
      expect(n.operator).to eql("Z")
      expect(output_hash).to have_key(:new_expression)
      expect(output_hash).to have_key(:to_queue)
      expect(output_hash[:new_expression]).to eql("0")
      expect(output_hash[:to_queue]).to be false
    end
  end

  describe "check transformation for S operator" do
    it "returns the S-transformed expression, to queue flag is false" do
      n = Node.new("Z", "A", "0")
      output_hash = n.transform
      expect(n.operator).to eql("S")
      expect(output_hash).to have_key(:new_expression)
      expect(output_hash).to have_key(:to_queue)
      expect(output_hash[:new_expression]).to eql("A(Z(A)(0))")
      expect(output_hash[:to_queue]).to be false
    end
  end

  describe "shows output in the correct format" do
    it "prints a node of type A as A(u)" do
      n = Node.new("1")
      expect { n.show }.to output("A(1)\n").to_stdout
    end

    it "prints a node of type A as Z(u)(v)" do
      n = Node.new("1", "10")
      expect { n.show }.to output("Z(1)(10)\n").to_stdout
    end

    it "prints a node of type S as S(u)(v)(w)" do
      n = Node.new("Z", "A", "0")
      expect { n.show }.to output("S(Z)(A)(0)\n").to_stdout
    end
  end
end
