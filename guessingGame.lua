--[[
  Create global function to calculate 
  the difference between the user input and the random number
]]
function numOffBy(random, input)
	return input - random
end

function main()
	print("welcome to the high low guessing game")
	local ranNum = math.random(0, 100)
	-- print(ranNum)
	local count = 1

	while true do
		local guess

		while true do
			print("Guess " .. count .. " - Enter an Integer (0-100): ")
			guess = io.read("*n") -- Get integer from the user

			if tonumber(guess) and guess >= 0 and guess <= 100 then -- Check if the input is a number
				break -- if so, continue
			else
				print("Invalid input: Enter an integer between 0 and 100!") -- if not, tell user to enter an integer
			end
			io.read("*l") -- consume the invalid input
		end

		local numOff = numOffBy(ranNum, guess)
		if numOff > 10 then -- If the guess is really high
			print("Your guess is very high ")
			count = count + 1
		elseif numOff > 0 then -- If the guess is a little high
			print("Your guess is a little high")
			count = count + 1
		elseif numOff < -10 then -- If the guess is really low
			print("Your guess is very low ")
			count = count + 1
		elseif numOff < 0 then -- If the guess is a little low
			print("Your Guess is little low")
			count = count + 1
		elseif numOff == 0 then -- If the guess is correct
			print("You Guessed the number! It was: " .. ranNum)
			break
		end
	end

	print("Thanks for playing!")
end

main()