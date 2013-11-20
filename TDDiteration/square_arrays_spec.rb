require "./square_arrays_solution"

describe "#square_array"  do
	it "should return an array in which new elements are the square of the original elements" do 
		expect(square_array([2,4,6])).to eq([4,16,36])
	end

	# this one works only if you use the { } for some reason.
	it "should get an error if a non-numeric array is passed in" do
		expect{square_array(["a","b","c"])}.to raise_error
	end

	it "should return an empty array if an empty array is passed in" do
		expect(square_array([])).to eq([])
	end

end

