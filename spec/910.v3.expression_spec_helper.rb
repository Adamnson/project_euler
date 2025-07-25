require_relative "../scripts/910.l_expressions_2_v3"

describe Expression do
  describe "#initialize" do
    it "creates a new expression, identifies start" do
      e = Expression.new("A(0)")
      expect(e.value).to eql("A(0)")
      expect(e.queue).to be_empty
      expect(e.tail).to be_empty
    end
  end

  describe "#format" do
    it "updates @node" do
      e = Expression.new("A(0)")
      expect(e.value).to eql("A(0)")
      expect(e.queue).to be_empty
      expect(e.tail).to be_empty
      expect { e.format }.to change(e, :node).from(nil)
    end

    it "updates @value" do
      e = Expression.new("A(0)")
      expect(e.value).to eql("A(0)")
      expect(e.queue).to be_empty
      expect(e.tail).to be_empty
      expect { e.format }.to change(e, :value).from("A(0)").to("1")
    end
  end

  describe "check S(Z)(A)(0)" do
    it "evaluates to 1" do
      e = Expression.new("S(Z)(A)(0)")
      4.times do
        e.solve
      end
      expect(e.value).to eql("1")
    end
  end

  describe "check S(S)(S(S))(S(Z))(A)(0)" do
    it "evaluates to 6" do
      e = Expression.new("S(S)(S(S))(S(Z))(A)(0)")
      43.times do
        e.solve
      end
      expect(e.value).to eql("6")
    end
  end

  describe "check queuing of A operator" do
    it "adds A to the queue if the parameter is not a number" do
      e = Expression.new("A(A(A(A(A(A(0))))))")
      e.solve
      expect(e.queue).to match_array(["A"])
      expect(e.value).to eql("A(A(A(A(A(0)))))")
      3.times do
        e.solve
      end
      expect(e.queue).to match_array(%w[A A A A])
      expect(e.value).to eql("A(A(0))")
      2.times do
        e.solve
      end
      expect(e.queue).to match_array(%w[A A A A])
      expect(e.value).to eql("A(1)")
      4.times do
        e.solve
      end
      expect(e.queue).to match_array(%w[])
      expect(e.value).to eql("A(5)")
      e.solve
      expect(e.queue).to match_array(%w[])
      expect(e.value).to eql("6")
    end
  end
end
