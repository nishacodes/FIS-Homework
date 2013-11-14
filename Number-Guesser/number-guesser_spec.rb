require './number-guesser'

describe "#number-guesser" do
  it "returns false if the guess doesn't equal the number" do
    guess=12
    Game.new.numberguesser(12).should eq(true)
  end

  it "returns true if the guess equals the number" do
    5.numberguesser(5).should eq(true)
  end

end