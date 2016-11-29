function [labels, m] = getLabels(item)
m = 0;
labels = {};
for i = 1:length(item)
    labels{i} = item{i}{7};
    if item{i}{1} == 1
        m = m+1;
    end
end
% Alphabetically ordered
labels = unique([labels{1:end}]);