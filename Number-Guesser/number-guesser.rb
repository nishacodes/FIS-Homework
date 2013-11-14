# Project specs:
 
# Should ask the user to enter a number between 1 and 100
# Should receive input from the user
# Should tell the user if they were correct or incorrect

# CHALLENGE:
# Write a test to check that your file correctly tells the user if they 
# are right or wrong.

class Game
def numberguesser(number)
puts "Pick a number between 1 and 100"
guess=gets.chomp.to_i
guess == number
end
end