-- init Table
local options = {
	[1] = "Rock",
	[2] = "Paper",
	[3] = "Scissors",
}

function printOptions()
	print() -- spacing
	for key, value in pairs(options) do
		print(key .. " = " .. value)
	end
	io.write("Enter an integer value:")
end

function printScores(botWins, playerWins)
	print()
	print("Current Score: ")
	print("Bot - " .. botWins)
	print("Player - " .. playerWins)
end

-- Function to find who won the round
function roundWinner(userPick, botPick)
	if
		userPick == "Rock" and botPick == "Scissors"
		or userPick == "Paper" and botPick == "Rock"
		or userPick == "Scissors" and botPick == "Paper"
	then
		print("Round result: Player Wins")
		print("---- ---- ---- ----")
		return true
	elseif
		botPick == "Rock" and userPick == "Scissors"
		or botPick == "Paper" and userPick == "Rock"
		or botPick == "Scissors" and userPick == "Paper"
	then
		print("Round result: Bot wins")
		print("---- ---- ---- ----")
		return false
	else
		print("Round result: Tie")
		print("---- ---- ---- ----")
		return nil
	end
end

function main()
	print("Welcome to Rock, Paper, Scissors!")
	print("player vs. Bot")
	print("Best 2 out of 3")

	local botWins = 0
	local playerWins = 0
	local round = 1

	while true do
		-- Bot picks his choice
		local botPick = options[math.random(3)] -- Random integer: 1, 2, or 3

		printScores(botWins, playerWins)

		print()
		io.write("Round " .. round .. ": ")
		printOptions()
		-- print("botPick: " .. botPick)

		local userPick

		-- Best 2 out of 3
		while true do
			userPick = io.read("*n") -- Get integer from the user
			if tonumber(userPick) and userPick > 0 and userPick < 4 then -- Check if the input is a number
				userPick = options[userPick]
				break -- User input is a 1, 2, or 3
			else
				print("Invalid input: Enter an integer!") -- if not, tell user to enter an integer
			end
			io.read("*l") -- consume the remaining input
		end

		print() -- Spacing
		print("Bot's Choice: " .. botPick)
		print("Player's Choice: " .. userPick)

		local winner = roundWinner(userPick, botPick)
		if winner == true then -- Player won
			-- print("Player plus one")
			playerWins = playerWins + 1
			round = round + 1
		elseif winner == false then -- Bot won
			-- print("Bot plus one")
			botWins = botWins + 1
			round = round + 1
		elseif winner == nil then -- Tie`
			-- print("nothing added")
			round = round + 1
		end

		-- Find out who won
		if botWins == 2 then
			printScores(botWins, playerWins)
			print("The Bot Won the Game!")
			break
		elseif playerWins == 2 then
			printScores(botWins, playerWins)
			print("The Player Won the Game!")
			break
		end
	end
end

main() -- Run the program