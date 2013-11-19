
# COLLECT APPLES WITH EACH METHOD

def apple_picker(array)
	apples = []
	array.each do |fruit|
		apples << fruit if fruit == "apple"
	end
	apples
end

apple_picker(["apple", "asdasd", "sadad","apple"])


# COLLECT APPLES WITH COLLECT METHOD

def apple_picker(array)
	apples = array.collect do |fruit|
		fruit if fruit == "apple"
	end
	apples.compact!  # removes items that are nil
end

# COLLECT APPLES WITH SELECT METHOD

def apple_picker(array)
	apples = array.select do |fruit|
		fruit == "apple"
	end
	apples  
end

# The COLLECT method will iterate through each item in the array
# and collect the result of each iteration in an array. 
# The SELECT method will iterate through each item in the array
# and collect the item if the result is true, and do nothing if the result is false. 
# It won't allow manipulation of the item in any way. 