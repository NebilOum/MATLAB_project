k = input("Enter the number of matches you want to see in each trial: ");
trial = input("Enter the number of trials: ");
size = input("Enter array size: ");
matchesPerTrial = zeros(1, trial); % Initialize an array to store matches count for each trial

for i = 1:trial
    array = randperm(size); % Generate a new random array for each trial
    matchesPerTrial(i) = arrayIndexMatch(array, k); % Count matches for this trial
end

disp("Number of matches for each trial:");
disp(matchesPerTrial);

totalMatches = sum(matchesPerTrial);
disp("Total number of trials where the number of matches equals k:");
disp(totalMatches);

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

