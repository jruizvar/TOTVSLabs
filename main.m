% Parse and extract the data
sample = fopen('sample.txt');
data = textscan(sample,'%s','Delimiter','\n');
item = items(data,length(data{1}));

% Get income and labels
m = 0;
labels = {};
for i = 1:length(item)
    labels{i} = item{i}{7};
    if item{i}{1} == 1
        m = m+1;
    end
end
labels = unique([labels{1:end}]); % Alphabetically ordered
n = length(labels);
X = zeros(m,n);
for j = 1:n
    X(:,j) = getIncome(item,labels{j},m);
end

% Average income
S = mean(X);
T = sum(S);
% Mean income excluding BUFFET, REFRIGERANTE, e AGUA
t = T - S(3) - S(14) - S(1);

% Make pie chart of average income
l3  = sprintf('%s: %.0f %%', labels{3},   100*S(3)/T);
l14 = sprintf('%s: %.0f %%', labels{14}, 100*S(14)/T);
l1  = sprintf('%s: %.0f %%', labels{1},  100*S(1)/T);
l0  = sprintf('OTHERS: %.0f %%', 100*t/T);
p = pie([S(3) S(14) S(1) t], {l3, l14, l1, l0});

% Full table of items
AverageIncome = round(S,3)';
tab = table(AverageIncome, 'RowNames', labels');
tab = sortrows(tab,'AverageIncome','descend')