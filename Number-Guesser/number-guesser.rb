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
		@diff = 0
		@lastdiff = 0
	end

	def numberguesser
		@lastdiff = ((@number - @guess).abs)if @guess != 0
		@number = rand(1..100)
		puts "I'm thinking of a number between 1 and 100. Try and guess it."
		while @guess != @number do 
			# before a new guess is made, see the diff of last guess
			@lastdiff = ((@number - @guess).abs)if @guess != 0  
			@guess = gets.chomp.to_i
			# validation the guess is number btw 1..100
			unless @guess.between?(1,100) 
				puts "That's not a valid guess!" 
			else
			puts @guess == @number ? 
				"You got it! It only took you #{@count} tries. Want to play again? (Y / N)" : "Nope, try again." 
			higherlower
			@diff = (@number - @guess).abs
			warmercolder if @count > 1 && @guess != @number
			@count += 1
			end
		end
		playagain = gets.chomp.downcase
		playagain == "y" ? numberguesser : "Bummer. Have a nice day."
	end

	def higherlower
		case 
			when @guess > @number
				puts "(Hint #1: You guessed too high)"
			when @guess < @number
			puts "(Hint #1: You guessed too low)"
		end
	end

	def warmercolder
		if @diff > @lastdiff 
			puts "(Hint #2: You are getting colder)"
		else
			puts "(Hint #2: You are getting warmer)"
		end
	end
end

Game.new.numberguesser


