function numThrows = findFiveOfAKind(numDice)
outcome = throwDice(numDice);
numThrows = 1;
while true
    [most_common, count_most_common] = mode(outcome);
    if count_most_common == numDice
        break;
    end
    dice_to_throw_again = find(outcome ~= most_common);
    outcome(dice_to_throw_again) = throwDice(length(dice_to_throw_again));
    numThrows = numThrows + 1;
end

end
