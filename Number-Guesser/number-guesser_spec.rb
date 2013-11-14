require './number-guesser'

describe Game, "#number-guesser" do
  
	it "should return an integer" do
		expect(Game.new.roll).to be_a(Integer)
	end

	it "should be greater than 0" do
	
	end

	it "should be less than 1" do

	end

  it "returns false if the guess doesn't equal the number" do
    guess=12
    Game.new.numberguesser(12).should eq(true)
  end

  it "returns true if the guess equals the number" do
    Game.new.numberguesser(27).should eq(27)
  end

end