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
			return "51893729, 51987311, 51876358, 51982811, 51983282"
		end

		def displaymenu()
			@output.puts("Menu: (1) Play | (2) New | (3) Analysis | (9) Exit")
		end
		
		#This will reset all of the variables needed in the game and resets their value to zero
		def resetgame()
			@output.puts("New game...")
			@sequence = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
			@selectedboxes = []
			@openedboxes = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
			@chosenbox = 0
			@selectedbox = 0
			@turn= 0
			@turnsleft = GOES
			@winner = 0
			@played = 0
			@wins = 0
			@losses = 0
			@guess = ""
			@values = [0.01,0.10,0.50,1.00,5.00,10.00,50.00,100.00,250.00,500.00,750.00,1000.00,3000.00,5000.00,10000.00,15000.00,20000.00,35000.00,50000.00,75000.00,100000.00,250000.00]
			@amounts = @values		
		end

		def assignvaluestoboxes()
			@sequence = @values.shuffle
		end

		#This is an iteraion that will check the value of @openedboxes and see if it is 0 or 1. If it is 0 that means the box is closed, otherwise that means the box is opened	
		def showboxes()
			for i in (0..21) do
				s = "_"
				g = "_"
				b = i + 1
				if @openedboxes[i] == 0
					s = "Closed"
					g = "[#{b}]"
				else
					s = "Opened"
					g = "|#{b}|"
				end
				@output.print("#{g} ")					
			end
			@output.print("*#{@chosenbox}* ")
		end

		#this shows the values of the amounts in the form of columns. This is given in order to let the player know about the other boxes in the game	
		def showamounts()
			col1 = 0
			col2 = 11
			for i in (0..10)
				c1 = @amounts[col1 + i]
				c2 = @amounts[col2 + i]
				@output.puts("#{c1}   #{c2}")
			end
		end

		def removeamount(value)
			index = @amounts.index(value)
			@amounts[index] = "    "
		end

		#this will set the chosen box equal to the input
		def setchosenbox(num)
			@chosenbox = num
		end

		#this shows that the getchosenbox method has value of the @chosenbox
		def getchosenbox()
			return @chosenbox
		end

		#this creates a string with the number that the player chose at the beginning of the game
		def displaychosenbox()
			@output.puts("Chosen box: [#{@chosenbox}]")	
		end

		def displaychosenboxvalue()
			@output.puts("Chosen box: [#{@chosenbox}] contains: #{@sequence[@chosenbox - 1]}")	
		end

		#this displays a string that will ask the player which number the player would like to keep
		def displaychosenboxprompt()
			@output.puts("Enter the number of the box you wish to keep.")
		end

		def displaychosenboxerror()
			@output.puts("Error: Box number must be 1 to 22.")
		end

		#this is another iteration chekcing the value of the @openedboxes. If it is closed it is 0 and otherwise is open. This will then print the result.
		def displayanalysis()
			@output.puts("Game analysis...")
			for i in (0..21) do
				s = "_"
				g = "_"
				b = i + 1
				if @openedboxes[i] == 0
					s = "Closed"
					g = "[#{b}]"
				else
					s = "Opened"
					g = "|#{b}|"
				end
				@output.puts("#{g} Status: #{s}")
			end
		end

		#this will check to see whether the box is 'valid', ie. within the range of designated numbers (1-22). It will display 0 for valid and 1 for invalid
		def boxvalid(num)
			num = num.to_i

			if (num > 0) && (num < 23)
				return 0
			else
				return 1
			end
		end

		#this will show a log of openedboxes (the boxes already opened)
		def showselectedboxes()
			@output.puts("Log: #{@selectedboxes.inspect}")
		end

		def displayselectboxprompt()
			@output.puts("Enter the number of the box you wish to open. Enter returns to menu.")
		end
		
		def openbox(num)
			@openedboxes[num-1] = 1
			@output.puts("|#{num}| Status: Opened")
		end

		def bankerphoneswithvalue(value)
			@output.puts("Banker offers you for your chosen box: #{value}")
		end

		def bankercalcsvalue(value)
			return value / 2
		end
		
		#an iteration to see how many boxes are still closed by checking the the value which the box  has (0 for closed, and opened otherwise) from @openedboxes
 		def numberofboxesclosed()
			count = 0
			for i in (0..@openedboxes.length) do
				if @openedboxes[i] == 0
					count += 1
				end
			end
			return count
		end

		def incrementturn()
			@turn += 1
			@turnsleft -= 1
		end

		def getturnsleft()
			return @turnsleft
		end

		#puts a string saying the game is finished
		def finish()
			@output.puts("... game finished.")
		end

		# Any code/methods aimed at passing the RSpect tests should be added above.
	end
end


