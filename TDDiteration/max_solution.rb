# prereqs arrays, methods, conditional logic
# part I. implement a maximum method that takes and array and returns the largest element of the array
# part II. reimplement this method as an instance method on the array class

def maximum(arr)
	arr.compact.sort.reverse[0]
end


# now rewrite this as a method on the array class
class Array
  def maximum
  	compact.sort.reverse[0]
  end
end
