% Main Algorithm To Calculate the Probability

% Case 1: n = 5 with exactly k matches for k = 0,1,2,...n
n = 5;
trials = 100; 
size = n;
simulated_prob = zeros(1, n+1);
theoretical_prob = zeros(1, n+1);

for k = 0:n
    matchesCount = 0;
    for i = 1:trials
        array = randperm(size);
        matchesCount = matchesCount + arrayIndexMatch(array, k);
    end
    simulated_prob(k+1) = matchesCount / trials;
    theoretical_prob(k+1) = nchoosek(n, k) * (1/n)^k * prod(1 - (1:n-1)./n);
end

% Plotting results as histogram
figure;
bar(0:n, [simulated_prob; theoretical_prob]', 'grouped');
xlabel('Number of Matches (k)');
ylabel('Probability');
title('Simulated vs Theoretical Probabilities For n = 5');
legend('Simulated', 'Theoretical');
grid on;

% Case 2: n = 20 with exactly k matches for k = 0,1,2,...n
n = 20;
trials = 100; 
size = n;
simulated_prob = zeros(1, n+1);
theoretical_prob = zeros(1, n+1);

for k = 0:n
    matchesCount = 0;
    for i = 1:trials
        array = randperm(size);
        matchesCount = matchesCount + arrayIndexMatch(array, k);
    end
    simulated_prob(k+1) = matchesCount / trials;
    theoretical_prob(k+1) = nchoosek(n, k) * (1/n)^k * prod(1 - (1:n-1)./n);
end

% Plotting results as histogram
figure;
bar(0:n, [simulated_prob; theoretical_prob]', 'grouped');
xlabel('Number of Matches (k)');
ylabel('Probability');
title('Simulated vs Theoretical Probabilities For n = 20');
legend('Simulated', 'Theoretical');
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
