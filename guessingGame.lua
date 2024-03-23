print("Welcome to the High Low Guessing Game")
local ranNum = math.random(0,100)
print(ranNum)
local count = 1

--[[
  Create global function to make calculate 
  the difference between the random number and the user input
]]--
function _G.numOffBy(random, input) 
  return input - random
end

while true do
  local guess

  while true do
    print("Guess " .. count .. " - Enter an Integer (0-100): ")
    guess = io.read("*n") -- Get integer from the user
  
    if tonumber(guess) then -- Check if the input is a number
      break -- if so, continue
    else
      print("Invalid input: Enter an integer!") -- if not, tell user to enter an integer
    end
    io.read("*l") -- consume the remaining input
  end

  local numOff = numOffBy(ranNum, guess)
    if numOff > 10 then
      print("Your guess is very high ")
      count = count + 1
    elseif numOff > 0 then
      print("Your guess is a little high")
      count = count + 1
    elseif numOff < -10 then
      print("Your guess is very low ")
      count = count + 1
    elseif numOff < 0 then
      print("Your Guess is little low")
      count = count + 1
    elseif numOff == 0 then
      print("You Guessed the number! It was: " .. ranNum)
      break
    end
end

print("Thanks for playing!")