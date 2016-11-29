function out = getIncome(item,label,m)
out = zeros(m,1);
pos = 0;
for i = 1:length(item)
    if item{i}{1} == 1
        pos = pos+1;
    end
    if strcmp(label,char(item{i}{7}))
        out(pos,1) = item{i}{5};
    end
end