require_relative "../scripts/910.l_expressions_2_v3"

describe Expression do
  describe "initialization" do
    it "creates a new expression, identifies start" do
      e = Expression.new("A(0)")
      expect(e.value).to eql("A(0)")
      expect(e.queue).to be_empty
    end
  end
end
