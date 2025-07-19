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
      expect { e.format }.to change(e, :value).from("A(0)").to(1)
    end
  end
end
