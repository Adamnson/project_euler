require_relative "../scripts/910.l_expressions_2_v2"

class L_Exp
  def S(u = "u", v = "v", w = "w")
    v + "(" + u + "(" + v + ")" + "(" + w + ")" + ")"
  end

  def Z(u = "u", v = "v")
    v
  end

  def A(x = @value)
    x + 1
  end
end

describe L_Exp do
  describe "#value setting" do
    it "sets the value as initialized" do
      sza0 = L_Exp.new("S(Z)(A)(0)")
      expect(sza0.value).to eql("S(Z)(A)(0)")
    end
  end

  describe "#s transform" do
    it "transforms S(u)(v)(w) as #{L_Exp.new('').S}" do
      # catch22
    end
  end

  describe "#z transform" do
    it "transforms Z(u,v) as #{L_Exp.new('').Z}" do
      # catch22
    end
  end

  describe "#a transform" do
    it "transforms A(x) as x + 1" do
      1.upto(22) { |i| expect(L_Exp.new(i).A).to eql(i + 1) }
    end
  end
end
