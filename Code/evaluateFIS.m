function aversion = evaluateFIS(income, age, a)
%evaluateFIS(income, age, a) determines a risk aversion level based on annual
%income (in thousands), age (in years), and the rules determined in
%fuzzy interface system a.
%	income		U1 = {x * 10^3 | 0 <= x <= 100}
%	age         U2 = {y | 0 <= y <= 100}

aversion = evalfis([income age], a);

end