require "./max_solution"

describe "#maximum"  do
	it "should return the max number from the array" do 
		expect(maximum([2,42,6])).to eq(42)
	end

	it "should return a single number if all the numbers are the same" do
		expect(maximum([4,4,4])).to eq(4)
	end

	it "should NOT raise an error if the array has a nil element" do
		expect{maximum([2,nil,5,3])}.to_not raise_error
	end

	it "should raise an error if the array has mixed elements" do
		expect{maximum([2,nil,"a",3])}.to raise_error
	end
end


describe Array, "#maximum"  do
	it "should return the max number from the array" do 
		expect([2,4,6].maximum).to eq(6)
	end

	it "should return a single number if all the numbers are the same" do
		expect([4,4,4].maximum).to eq(4)
	end

	it "should NOT raise an error if the array has a nil element" do
		expect([2,nil,5,3].maximum).to_not raise_error
	end

	it "should raise an error if the array has mixed elements" do
		expect{[2,nil,"a",3].maximum}.to raise_error
	end

end
