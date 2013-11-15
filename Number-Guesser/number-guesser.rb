# Project specs:
 
# Should ask the user to enter a number between 1 and 100
# Should receive input from the user
# Should tell the user if they were correct or incorrect
# Should tell the user if their guess  are 'higher' or 'lower' than the correct number
# Should tell the user if they are getter warmer or colder
# Should make it so that the secret number is random

# CHALLENGE:
# Write a test to check that your file correctly tells the user if they 
# are right or wrong.

class Game
	
	def initialize
		@guess = 0
		@number = rand(1..100)
		@count = 1
	end

	def numberguesser
		puts "I'm thinking of a number between 1 and 100. Try and guess it."
		@guess = 0
		@number = rand(1..100)
		while @guess != @number do 
			@guess = gets.chomp.to_i
			unless @guess.between?(1,100) # validation the guess is number btw 1..100
				puts "That's not a valid guess!" 
			else
			puts @guess == @number ? 
				"You got it! It only took you #{@count} tries. Want to play again? (Y / N)" : "Nope, try again." 
			higherlower
			@count += 1
			end
		end
		playagain = gets.chomp.downcase
		playagain == "y" ? numberguesser : "Bummer. Have a nice day."
	end

	def higherlower
		case 
			when @guess > @number
				puts "(Hint: You guessed too high)"
			when @guess < @number
			puts "(Hint: You guessed too low)"
		end
	end

	def warmercolder

	end
end

Game.new.numberguesser


