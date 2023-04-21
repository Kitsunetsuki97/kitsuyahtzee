function yahtzeegl8885(numExperiments, numDice)
% Initialize vector to store number of throws in each experiment
numThrowsVec = zeros(numExperiments, 1);

% Run experiments and store results in numThrowsVec
for i = 1:numExperiments
    numThrowsVec(i) = findFiveOfAKind(numDice);
end

% Calculate expected value and variance
expVal = mean(numThrowsVec);
varEst = var(numThrowsVec);

% Display results
disp(['Expected value: ' num2str(expVal)]);
disp(['Variance: ' num2str(varEst)]);

% Calculate histogram
binWidth = 1;
binEdges = 0.5:binWidth:max(numThrowsVec)+0.5;
binCounts = histcounts(numThrowsVec, binEdges);
binHeights = binCounts / (numExperiments * binWidth);

% Plot histogram
ax = histogram(numThrowsVec, binEdges, 'Normalization', 'countdensity');

% Add legend to plot
legend('Monte Carlo simulation', 'Analytic probability density function', 'Fitted Poisson distribution');

% Add Poisson PDF curve
lambda = expVal;
x = 0:max(numThrowsVec);
poissonPDF = poisspdf(x, lambda);
scaledPoissonPDF = poissonPDF * numExperiments * binWidth;
hold on
plot(ax.Parent, x, scaledPoissonPDF, 'r-', 'LineWidth', 2)
hold off
end