##Skills: 
# any?, all?, none?, each, map/collect

##Instructions:
# Code generates a random cart of items and a random set of coupons. 
# Implement a method checkout to calculate total cost of a cart of items 
# and apply discounts and coupons as necessary.
class Groceries
	attr_accessor :cart, :coups, :new_cart, :extra_discount,:totalcost

	ITEMS = [  {"AVOCADO" => {:price => 3.00, :clearance => true}},
				{"KALE" => {:price => 3.00,:clearance => false}},
				{"BLACK_BEANS" => {:price => 2.50,:clearance => false}},
				{"ALMONDS" => {:price => 9.00, :clearance => false}},
				{"TEMPEH" => {:price => 3.00,:clearance => true}},
				{"CHEESE" => {:price => 6.50,:clearance => false}},
				{"BEER" => {:price => 13.00, :clearance => false}},
				{"PEANUTBUTTER" => {:price => 3.00,:clearance => true}},
				{"BEETS" => {:price => 2.50,:clearance => false}}]

	COUPS = [	{:item=>"AVOCADO", :num=>2, :cost=>5.00},
				{:item=>"BEER", :num=>2, :cost=>20.00},
				{:item=>"CHEESE", :num=>3, :cost=>15.00}]

	def initialize
		@cart = generateCart
		@coups = generateCoups
		@new_cart = reorganizeCart
		@totaldiscount
		@totalcost = 0.00
		@extra_discount = -10
	end

	def run
		# addCost
		# addCoupstoItem
		# coupDiscounts
		# lessThanFive
		# checkout
	end

	#randomly generates a cart of items
	def generateCart
		@cart = []
	  rand(20).times do
			@cart.push(ITEMS.sample)  
		end
		@cart
	end

	#randomly generates set of coupons
	def generateCoups
		@coups = []
		rand(2).times do
			@coups.push(COUPS.sample)
		end
		@coups
	end

	# adds a count to each item and removes duplicates
	def reorganizeCart
		@new_cart = {}
		@cart.each do |itemhash|
			itemhash.each do |item, details|
				@new_cart[item] = details
				# adds :count key value to the hash
				if @new_cart[item][:count].nil? 
					@new_cart[item][:count] = 1
				else
					@new_cart[item][:count] += 1
				end
			end
		end
		#gets rid of duplicate entries
		repeat = []
		@new_cart.each do |item, hash|
			if repeat.include?(item) 
				delete(item)
		 	else
		 		repeat << item
		 	end
		end
		@new_cart
	end

	def addCost
		@new_cart.each do |item, details|
			details[:cost] = (details[:price] * details[:count])
		end
	end

	def addCoupstoItem
		@new_cart.each do |item, details|
			details[:coups] ||=0
			@coups.each do |couponhash|
				if couponhash[:item]== item
					details[:coups] += 1
				end
			end
		end
	end

	# INCORPORATE: if the customer has 2 of the same coupon, triple the discount 
	def coupDiscounts
		@new_cart.each do |item, details|
			case
				when item == "CHEESE" && details[:coups] == 1 && details[:count] > 2
					details[:cost] = (((details[:count] / 3) * 15) + ((details[:count] % 3) * details[:price]))
				when item == "AVOCADO" && details[:coups] == 1 && details[:count] > 1
					details[:cost] = (((details[:count] / 2) * 5) + ((details[:count] % 2) * details[:price]))
				when item == "BEER" && details[:coups] == 1 && details[:count] > 1
					details[:cost] = (((details[:count] / 2) * 20) + ((details[:count] % 2) * details[:price]))
				end				
		end
	end		
	
	def lessThanFive
		@new_cart.each do |item, details|
			@extra_discount = 0 if details[:price] > 5
		end
		@extra_discount
	end

	def checkout
		@new_cart.each do |item, details|
			if details[:clearance]==true
				@totalcost += (details[:cost] * 0.8) + @extra_discount
			else
				@totalcost += (details[:cost]) + @extra_discount
			end
		end
		@totalcost
	end
end


nisha = Groceries.new
nisha.run

# puts "CART: #{nisha.cart}"
# puts "COUPS: #{nisha.coups}"

puts "NEW CART: #{nisha.new_cart}"
# puts nisha.totalcost


#the cart is currently an array of individual items, translate it into a hash that includes the counts for each item
#   For example if your cart was [  {"AVOCADO" => {:price => 3.00, :clearance => true}}, {"AVOCADO" => {:price => 3.00, :clearance => true}}]
#   it would become {"AVOCADO" => {:price => 3.00, :clearance => true}, :count => 2}
# #create a checkout method that calculates the total cost of the cart
# when checking out, check the coupons and apply the discount if the proper number of items is present
# #if any of the items are on clearance add a 20% discount
# if the customer has 2 of the same coupon, triple the discount
# if none of the items purchased have a unit price greater than 5$ give the customer a 10$ discount off the whole cart
