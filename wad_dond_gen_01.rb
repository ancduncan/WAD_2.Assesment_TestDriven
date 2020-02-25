# Ruby code file - All your code should be located between the comments provided.

# Main class module
module DOND_Game
	# Input and output constants processed by subprocesses. MUST NOT change.
	GOES = 5

	class Game
		attr_reader :sequence, :selectedboxes, :openedboxes, :chosenbox, :selectedbox, :turn, :input, :output, :winner, :played, :wins, :losses, :guess, :values, :amounts
		attr_writer :sequence, :selectedboxes, :openedboxes, :chosenbox, :selectedbox, :turn, :input, :output, :winner, :played, :wins, :losses, :guess, :values, :amounts

		def initialize(input, output)
			@input = input
			@output = output
		end
		
		def getinput
			@input.gets.chomp.upcase
		end
		
		def storeguess(guess)
			if guess != ""
				@selectedboxes = @selectedboxes.to_a.push "#{guess}"
			end
		end
		
		# Any code/methods aimed at passing the RSpect tests should be added below.
	
		def start()
			@output.puts("Welcome to Deal or No Deal!")
			@output.puts("Designed by: " + self.created_by())
			@output.puts("StudentID: " + self.student_id())
			@output.puts("Starting game...")
		end

		def created_by()
			return "Andrej Szalma, Matey Krastev, Antonia Duncan, Cammy Begg, Laura McKenna"
		end

		def student_id()
			return "123456789"
		end

		def displaymenu()
			@output.puts("Menu: (1) Play | (2) New | (3) Analysis | (9) Exit")
		end

		def resetgame()
			@output.puts("New game...")
		end
		# Any code/methods aimed at passing the RSpect tests should be added above.

	end
end


