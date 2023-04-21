function result = throwDice(numDice)
% This function takes a scalar input, numDice, and returns the outcome of a throw
% with numDice dice.

result = randi([1 6], [1 numDice]);

end


