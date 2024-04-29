% Main Algorithm To Calculate the Probability

% 1.6A: n = 5 with exactly k matches for k = 0,1,2,...n. Choose a value of
% k and compute the probability for that value of k

k = 3; % Set chosen k value
trial = 100; % Set number of trials
n = 5; % Set n value
matchesPerTrial = zeros(1, trial); % Initialize matches array

% Loop to iterate through given number of trials and create that many arrays
for i = 1:trial
    array = randperm(n); 
    matchesPerTrial(i) = arrayIndexMatch(array, k); % Searching for matches
end

% Find total number of events with k matches for chosen k value
totalMatches = sum(matchesPerTrial);

% Calculate simulated probability using number of events with k matches divided by total trials
simulated_probA = totalMatches/trial;
% Calculate theoretical probability using equation in 1.5
theoretical_probA = nchoosek(n, k) * prod(1./(n:-1:n-k+1)) * ((-1)^(n-k) / factorial(k)); 

% Displaying resuls and probabilities
disp("Number of matches for each trial:");
disp(matchesPerTrial);

disp("Total number of trials where the number of matches equals k:");
disp(totalMatches);

disp("The simulated probability is: ");
disp(simulated_probA)

disp("The theoretical probability is: ");
disp(theoretical_probA)

% Comparing theoretical and simulated probabilities
if theoretical_probA > simulated_probA
    disp("The theoretical probability is larger than the simulated");
elseif theoretical_probA == simulated_probA
    disp("The theoretical and simulated probabilities are the same");
else
    disp("The simulated probability is greater than the theoretical probability")
end

% 1.6B: n = 20 with exactly k matches for k = 0,1,2,...n. Plotting all
% probabilities for all k

% Set parameters
n = 20;
trials = 100; 
size = n;
probability = zeros(1, n+1); % Initialize probability array

matchCounts = zeros(1, n + 1);
for i = 1:trials
    matchesCount = 0;
    array = randperm(size);
    for ii = 0:n
        matchCounts(ii + 1) = matchCounts(ii + 1) + arrayIndexMatch(array, ii);
        probability(ii + 1) = matchCounts(ii + 1) / trials;
    end
end

% Plotting results as histogram
figure;
bar(0:n, probability, 'hist');
xlabel('Number of Matches (k)');
ylabel('Probability');
title('Probability of k Matches');
grid on;

% Custom Function To Check If Element Matches Index Value
function matchesCount = arrayIndexMatch(array, k)
    len = length(array);
    matchesCount = 0;
    for i = 1:len
        if array(i) == i
            matchesCount = matchesCount + 1;
        end
    end
    if matchesCount == k
        matchesCount = 1;
    else
        matchesCount = 0;
    end
end