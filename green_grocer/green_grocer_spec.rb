require "./green_grocer"

#---------------------------------------------------------------

describe Groceries, "#reorganizeCart" do 

nishacart = Groceries.new
nishacart.cart = [{"AVOCADO" => {:price => 3.00, :clearance => true}},
					{"AVOCADO" => {:price => 3.00, :clearance => true}},
					{"AVOCADO" => {:price => 3.00, :clearance => true}},
					{"BEER" => {:price => 13.00, :clearance => false}},
					{"BEER" => {:price => 13.00, :clearance => false}},
					{"CHEESE" => {:price => 6.50,:clearance => false}},
					{"CHEESE" => {:price => 6.50,:clearance => false}},
					{"CHEESE" => {:price => 6.50,:clearance => false}},
				]

	it "should create a new variable called new_cart equaled to this" do
		expect(nishacart.reorganizeCart).to eq({"AVOCADO"=>{:price=>3.0, :clearance=>true, :count=>3},
																						"BEER"=>{:price=>13.0, :clearance=>false, :count=>2}, 
																						"CHEESE"=>{:price=>6.50, :clearance=>false, :count=>3}
																						})
	end

end

#---------------------------------------------------------------

describe Groceries, "#addCost" do 

nishacart = Groceries.new
nishacart.new_cart = {"AVOCADO"=>{:price=>3.0, :clearance=>true, :count=>3},
											"BEER"=>{:price=>13.0, :clearance=>false, :count=>2}, 
											"CHEESE"=>{:price=>6.50, :clearance=>false, :count=>3}
											}

	it "should add a :cost key to each item with the total cost given the count" do
		expect(nishacart.addCost).to eq({"AVOCADO"=>{:price=>3.0, :clearance=>true, :count=>3, :cost=>9.0},
																		"BEER"=>{:price=>13.0, :clearance=>false, :count=>2, :cost=>26.0}, 
																		"CHEESE"=>{:price=>6.50, :clearance=>false, :count=>3, :cost=>19.5}
																		})
	end

end

#---------------------------------------------------------------

describe Groceries, "#addCoupstoItem" do 

nishacart = Groceries.new
nishacart.new_cart = {"AVOCADO"=>{:price=>3.0, :clearance=>true, :count=>3, :cost=>9.0},
											"BEER"=>{:price=>13.0, :clearance=>false, :count=>1, :cost=>13.0}, 
											"CHEESE"=>{:price=>6.50, :clearance=>false, :count=>3, :cost=>19.5}
											}
nishacart.coups = [{:item=>"AVOCADO", :num=>2, :cost=>5.00},
									{:item=>"BEER", :num=>2, :cost=>20.00},
									{:item=>"CHEESE", :num=>3, :cost=>15.00}]												

	it "should add a key :coups to each item hash with the number of coupons if applicable" do
		expect(nishacart.addCoupstoItem).to eq({"AVOCADO"=>{:price=>3.0, :clearance=>true, :count=>3, :cost=>9.0, :coups=>1},
																		"BEER"=>{:price=>13.0, :clearance=>false, :count=>1, :cost=>13.0, :coups=>0}, 
																		"CHEESE"=>{:price=>6.50, :clearance=>false, :count=>3, :cost=>19.5, :coups=>1}
																		})
	end

end

#---------------------------------------------------------------

describe Groceries, "#coupDiscounts" do 

nishacart = Groceries.new
nishacart.new_cart = {"AVOCADO"=>{:price=>3.0, :clearance=>true, :count=>3, :cost=>9.0},
											"BEER"=>{:price=>13.0, :clearance=>false, :count=>1, :cost=>13.0}, 
											"CHEESE"=>{:price=>6.50, :clearance=>false, :count=>3, :cost=>19.5}
											}
nishacart.coups = [{:item=>"AVOCADO", :num=>2, :cost=>5.00},
									{:item=>"BEER", :num=>2, :cost=>20.00},
									{:item=>"CHEESE", :num=>3, :cost=>15.00}]												

	it "should change the cost of each item to reflect coupons" do
		expect(nishacart.coupDiscounts).to eq({"AVOCADO"=>{:price=>3.0, :clearance=>true, :count=>3, :cost=>8.0, :coups=>1},
																		"BEER"=>{:price=>13.0, :clearance=>false, :count=>1, :cost=>13.0, :coups=>0}, 
																		"CHEESE"=>{:price=>6.50, :clearance=>false, :count=>3, :cost=>15.0, :coups=>1}
																		})
	end

end

#---------------------------------------------------------------

describe Groceries, "#lessThanFive" do 

nishacart = Groceries.new
nishacart.new_cart = {"AVOCADO"=>{:price=>3.0, :clearance=>true, :count=>3, :cost=>9.0},
											"BEER"=>{:price=>13.0, :clearance=>false, :count=>1, :cost=>13.0}, 
											"CHEESE"=>{:price=>6.50, :clearance=>false, :count=>3, :cost=>19.5}
											}										

	it "should change the extra_discount to 0 if there is an time > $5" do
		expect(nishacart.lessThanFive).to eq(0)
	end

end

#---------------------------------------------------------------

describe Groceries, "#checkout" do 

nishacart = Groceries.new
nishacart.new_cart = {"AVOCADO"=>{:price=>3.0, :clearance=>true, :count=>3, :cost=>9.0},
											"BEER"=>{:price=>13.0, :clearance=>false, :count=>1, :cost=>13.0}, 
											"CHEESE"=>{:price=>6.50, :clearance=>false, :count=>3, :cost=>19.5}
											}										

	it "should change the extra_discount to 0 if there is an time > $5" do
		expect(nishacart.checkout).to eq(0)
	end

end

#---------------------------------------------------------------


# describe "#discounts" do 

# 	it "should apply 3x the discount if customer has 2 same coupons" do

# 	end

# 	it "should apply 20% discount to all cleanance items" do
	
# 	end

# 	it "should apply a $10 discount if no items are more than $5" do
	
# 	end

# end

# describe "#checkout" do 

# 	it "should have the same number of items in the original cart" do

# 	end

# 	it "should return a value <= equal to the total cost of all the individual items" do

# 	end

# 	it "should incorporate all the discounts calculated" do

# 	end

# end



