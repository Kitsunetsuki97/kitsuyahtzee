# kitsuyahtzee
yahtzee.m

Problem Formulation
The dice game of Yahtzee is played with five regular six-sided dice. The players throw the dice one at a
time and try to get different combinations of die values. The highest number of points is given for five of-
a-kind, which is also called Yahtzee. A player may throw the dice three times at each turn: one original
throw and two times when the player may keep some of the dice and reroll the other ones.
In this mini-project, we will not limit ourselves to three throws, but wonder: How large is the probability
to obtain five-of-a-kind using a certain number of throws? What is the average number of throws (see the
description of the expected value in Section 3) needed to obtain five-of-a-kind? One way of measuring the
variations in the number of throws (how common it is to be close to the expected value) is the variance,
which is also described in Section 3.

1.1 Presentation
The problem must be solved as an individual project. You are not allowed to share or show MATLAB code
or notes to students from other students. It is, however, permitted to discuss the project with other
students; for example, to share some good advice!
• You should write a MATLAB function, Yahtzee, that simulates a large number of attempts to obtain five-
of-a kind. The function should draw a histogram over the number of throws that are needed. The function
Yahtzee should call other functions, that you’ve written yourself, to solve certain subproblems.
• You will need to turn in several files for this project. These include your .m files, resulting histograms,
and a report.

2 Suggested Solution Outline
Begin by reading through the whole document so that you understand the problem specification and our
suggested way to divide the problem into smaller subproblems.
The steps below provide one way to split the main programming problem into subproblems that can be
solved one at a time. We have chosen the subproblems to make it possible to verify each part before you
continue with the next part. Make sure to take these opportunities! Although the solution outline suggests
that you write small functions that each solve a subproblem, this doesn’t mean that it is good or efficient
to use (call) all these small functions to solve the original problem. Some functions take care of such small
pieces that, once you have it working, it is better to copy the code into a new larger function than to call
the small function.

Note that this solution outline is intended for students with little or no previous programming experience.
An experienced programmer would probably, based on previous experience, divide the problem into
different and/or fewer parts. If you consider yourself an experienced programmer and think that you have
a better approach to solve the problem, you can solve it in your own way. However, if you need help, your
instructor has more experience with the outlined solution. If you don’t follow the solution outline you must
at least make sure that the solution gives the same functionality. Also, you MUST have at least 3 separate
m files (i.e. a main script and at least 2 functions).

2.1 Several Throws
Write a function that simulates a throw with a given number of dice and returns the result. Let the number
of dice be an input argument to the function and return the result as a vector with the results of the throw.
Hint: Create a vector with random numbers in the interval 0 to 1, one number for each die, multiply by 6,
and round upwards. Or, use the randi() function to create your vector.

2.2 Count the Number of Each Outcome
Write a function that takes the outcome of a throw with five dice as an argument and returns a vector with
the number of ones, twos, and so on. Ask the instructor for help if you get stuck here for too long!
Example:
• The outcome [1 4 2 2 4] should yield [1 2 0 2 0 0] (one one, two twos, no threes, two fours, and no fives or
sixes).

2.3 Find Out Which Outcome is Most Common
Modify the function from the step 2.2 to return the most common outcome (ones, twos, threes, ...). The
vector previously returned should come in handy. If there are two pairs in the result, just return one of
them. It doesn’t matter which of them is returned, thus you can choose if you like small or large values.
Test the function and make sure that it works properly!
Examples:
• The outcome [4 5 4 4 1] should yield 4 (four is the most common outcome).
• The outcome [1 4 2 2 4] should yield either 2 or 4 (you decide).

2.4 Find the Dice to Throw Again
With the knowledge of the most common outcome, it is time to decide which dice to save and which to
throw again. There are two ways to do this:
1. One alternative is to modify the function from Step 2.3 so that it returns a vector containing the indices of
the dice to throw again; that is, the dice not showing the number computed in Step 2.3. Test the function!
• The dice [4 5 4 4 1] should yield [2 5] (throw dice number 2 and 5 again).
• The dice [1 4 2 2 4] should yield [1 2 5] or [1 3 4] (you decide).
2. The second alternative is to put the dice to save at the beginning of the dice vector. Since the value that
the dice you save (from Section 2.3) and how many such dice you have (from Step 2.2) is known, it is
possible to create a vector with the correct number of dice and values. After modifying the function be
sure to test it before you proceed!
Examples:
• The outcome [4 5 4 4 1] should yield [4 4 4 * *] (where * will be thrown again and so the value is
unimportant).
• The outcome [1 4 2 2 4] should yield either [2 2 * * *] or [4 4 * * *] (you decide).

2.5 Five-of-a-Kind
Now extend the function to throw the selected dice again, and to repeat this procedure until five-of-a kind
is obtained (i.e., there are no dice to throw again). Let the function return how many throws were needed.
Hint: Use a while loop.
Before continuing with the next step make sure that the function works. One way to do this is to, just for
now, display and study the result after each throw.
Be careful with the situation when you first get two-of-a-kind in one throw and on the next throw you get
three of another kind, then you should save the one with three-of-a-kind instead of the one you saved at
first.

2.6 Monte Carlo Simulation
A Monte Carlo simulation means that that you perform an experiment many times in order to get an idea
of how the underlying probability function looks. Write a (new) function that throws dice until you have
obtained five-of-a-kind many times. Your code should be able to run 10,000 experiments in a few minutes,
otherwise you need to optimize your code. It may be good to write out something with disp() to follow the
progress. Store the number of throws needed in each experiment in a vector. Plot a histogram to illustrate
the result (i.e., the number of throws needed). The histogram bins should have width 1. The function
should take the number of experiments as an input argument.

2.7 Compute Estimates of the Expected Value and Variance
Modify the function to also return estimations of the expected value and variance for the number of
throws. The average value is an estimate of the expected value, and a formula to estimate the variance is
given in Section 3. In this case xi is the number of throws needed in experiment i, and n is the number of
experiments. Ask the instructor if you cannot work out how to use the formulas!
Section 3 also presents the theoretical expected value and variance. Run a large number of experiments
to test that the estimates from your function are close to the exact values!

2.8 Compare with the Analytic Solution
Extend your function to also plot the analytic probability function in the same figure as the histogram from
the Monte Carlo simulations (Hint: Plot the histogram first and then the probability function by using hold
on). The analytic probability function can be found in Section 3 and you should compute it for k from 1 to
some appropriate number. To compare the results, keep the following in mind: The sum of the heights of
the bins in the histogram equals the number of experiments in the Monte Carlo simulation. On the other
hand, the sum of the probabilities in the probability function adds up to 1 (five-of-a-kind will turn up sooner
or later). Hence, to get comparable results either the values in the histogram or the probability function
must be scaled.
Note: The histogram and the analytic probability function should have approximately the same shape,
particularly when you conduct 10,000 experiments in the Monte Carlo simulation. If this is not the case,
there is a high probability that something wrong in your solution.
If you have called your function Yahtzee, the following command in MATLAB should produce a plot with
the estimated probability function (the histogram) and the analytic solution, as well as the estimated
expected value mhat and the variance s2hat.
>> [mhat, s2hat] = Yahtzee(experiments)

where the input, experiments, is the number of experiments in the Monte Carlo simulation (the number
of five-of-a kind runs that are simulated). Compare the behavior for a small and large number of
experiments, respectively.

2.9 Report and Code Preparation
• In addition to the main script, you need to have at least two functions in your code
• All file names need to include your access ID
• Functions and variables need to have descriptive names
• There should be a reasonable amount of comments in the code
• All figures should be self-explanatory

3 Useful Facts
Probability Theory: Definitions
Let X denote the outcome (result) of a die throw (X is a so called random or stochastic variable). P denotes
the probability for a certain outcome; for example, P(X = 3) is the probability to get a three.
The probability function pX(k) is defined to be pX(k) = P(X = k).
For a fair die, the probabilities of the outcomes are pX(k) = 1/6, for k = 1, ..., 6.
Throwing several dice, or the same die several times, are independent events. It follows that P(X1 = k1, X2 =
k2) = P(X1 = k1) · P(X2 = k2), which means that the individual probabilities are multiplied.
As another example of a stochastic variable, let Y be the number of throws needed to get five-of-a kind.
The expected value (mean) of a stochastic variable Y can be interpreted as the average outcome of an
experiment: “How many throws are needed on average to get five-of-a-kind?”
The variance is a measure that tells how large the (squared) deviations are from the expected value. If the
variance is small, that implies that the number of throws needed to get five-of-a-kind stays approximately
the same from time to time, whereas a large variance indicates that the number of throws may vary
substantially.

3.1 The Probability Density Function in the Assignment
As described above, the probability function in the problem formulation can be described using a matrix:
Let p(k) be the probability that k throws are needed to get five-of-a-kind. It then holds that
Where eT is the transpose of e.
For the interested: The above formulas are derived using the following approach: The probability to get
five-of-a-kind in k throws is equal to the probability to have four-of-a-kind in throw k − 1 and in throw k
get another of the same kind, together with the probability of three-of-a-kind in throw k − 1 and get
another two in throw k, etc. The vector x(k) can now be constructed,
and the probabilities can be calculate recursively as x(k) = Ax(k − 1) = A2 x(k − 2) = . . . , where A contains
the probabilities for the result in one throw.
