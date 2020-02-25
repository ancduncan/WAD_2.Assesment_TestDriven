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
			@sequence = @values
		end

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

		def setchosenbox(num)
			@chosenbox = num
		end

		def getchosenbox()
			return @chosenbox
		end

		def displaychosenbox()
			@output.puts("Chosen box: [#{@chosenbox}]")	
		end

		def displaychosenboxvalue()
			@output.puts("Chosen box: [#{@chosenbox}] contains: #{@sequence[@chosenbox - 1]}")	
		end

		def displaychosenboxprompt()
			@output.puts("Enter the number of the box you wish to keep.")
		end

		def displaychosenboxerror()
			@output.puts("Error: Box number must be 1 to 22.")
		end

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

		def boxvalid(num)
			num = num.to_i

			if (num > 0) && (num < 23)
				return 1
			else
				return 0
			end
		end

		# In Test the function is called showboxesselected (I think its only a typo)
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
=begin
		def finish()
			@output.puts("... game finished.")
		end
=end
		# Any code/methods aimed at passing the RSpect tests should be added above.
	end
end


