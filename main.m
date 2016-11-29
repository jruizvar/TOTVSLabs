% Parse and extract the data
sample = fopen('sample.txt');
data = textscan(sample,'%s','Delimiter','\n');
item = getItems(data,length(data{1}));

% Get labels. Get number of transactions
[labels, m] = getLabels(item);
n = length(labels);
X = zeros(m,n);
for j = 1:n
    X(:,j) = getIncome(item,labels{j},m);
end

% Average income
S = mean(X);
T = sum(S);
% Average income excluding BUFFET, REFRIGERANTE, e AGUA
reducedT = T - S(3) - S(14) - S(1);

% Make pie chart of average income
l3  = sprintf('%s: %.0f %%', labels{3},  100*S(3)/T);
l14 = sprintf('%s: %.0f %%', labels{14}, 100*S(14)/T);
l1  = sprintf('%s: %.0f %%', labels{1},  100*S(1)/T);
lo  = sprintf('OTHERS: %.0f %%', 100*reducedT/T);
p = pie([S(3) S(14) S(1) reducedT], [1 0 0 0], {l3 l14 l1 lo});

% Full table of items
AverageIncome = round(S,3)';
transLabels = labels';
tab = table(AverageIncome, 'RowNames', transLabels);
tab = sortrows(tab,'AverageIncome','descend')