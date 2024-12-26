require_relative "../scripts/910.l_expressions_2_v2"

describe L_Exp do
  describe "#value setting" do
    it "sets the value as initialized" do
      sza0 = L_Exp.new("S(Z)(A)(0)")
      expect(sza0.value).to eql("S(Z)(A)(0)")
    end
  end
end
