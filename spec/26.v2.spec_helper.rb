require_relative "../scripts/26.reciprocal_cycles_v2.rb"

describe Reciprocal do
  describe "initialize variables" do
    it "assigns class variables correctly" do
      rec = Reciprocal.new(2)
      expect(rec.num).to eql(2)
      expect(rec.denominator).to eql("")
      expect(rec.sequence).to eql("")
    end
  end

  describe "calculates denominator for a given number" do
    it "calculates denominator of terminating kind correctly" do
      rec = Reciprocal.new(5)
      rec.find_denominator
      expect(rec.num).to eql(5)
      expect(rec.denominator).to eql("2")
    end

    it "calculated denominator of non-terminating kind correctly" do
      rec = Reciprocal.new(3)
      rec.find_denominator
      expect(rec.num).to eql(3)
      expect(rec.denominator).to eql("3"*100)
    end   
  end
end