function yahtzee()
% set number of dice to throw
numDice = 5;

% call throwDice to get the outcome of a throw
throwDice(numDice);

% display the outcome of the throw
numThrows = findFiveOfAKind(numDice);
disp(['It took ' num2str(numThrows) ' throws to get five-of-a-kind.']);

% set number of experiments for Monte Carlo simulation
numExperiments = 10000;

% call monteCarloSimulation to get expected value, variance, and number of throws vector
monteCarloSimulation(numExperiments,numDice);

end


