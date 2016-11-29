function out = items(data, m)
out = {};
pos = 1;

formSpec = [...
'"nItem": "%d" '...
'"prod": {"indTot": "%d" '...
'"qCom": %f '...
'"uCom": "%[^"]" '...
'"vProd": %f '...
'"vUnCom": %f '...
'"xProd": "%[^"]'...
];

for i = 1:m-8
    prod = textscan([data{1}{i:i+8}], formSpec, 1, 'Delimiter', ',');
    if (isempty(prod{1}) & isempty(prod{7}))==0
        out{pos}{1} = prod{1};
        out{pos}{2} = prod{2};
        out{pos}{3} = prod{3};
        out{pos}{4} = prod{4};
        out{pos}{5} = prod{5};
        out{pos}{6} = prod{6};
        out{pos}{7} = prod{7};
        pos = pos+1;
    end
end