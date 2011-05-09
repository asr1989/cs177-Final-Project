function a = buildFIS()
%buildFIS() initializes and congifigures a fuzzy logic system designed to output
% a risk aversion level given an income and age.  Once the system has been 
% initialized and configured using buildPIS(), it can be implemented by
% calling the function evaluateFIS().

a = newfis('Risk Aversion');

a = addvar(a, 'input', 'Annual Income', [0 1000]);
a = addmf(a, 'input', 1, 'low', 'trapmf', [0 0 20 70]);
a = addmf(a, 'input', 1, 'middle', 'trapmf', [20 70 300 500]);
a = addmf(a, 'input', 1, 'high', 'trapmf', [300 500 1000 1000]);

a = addvar(a, 'input', 'Age', [0 120]);
a = addmf(a, 'input', 2, 'young', 'trapmf', [0 0 35 40]);
a = addmf(a, 'input', 2, 'middle', 'trapmf', [35 40 60 65]);
a = addmf(a, 'input', 2, 'old', 'trapmf', [60 65 120 120]);

a = addvar(a, 'output', 'Risk Aversion', [0 10]);
a = addmf(a, 'output', 1, 'low', 'trapmf', [0 0 2 4]);
a = addmf(a, 'output', 1, 'moderate', 'trapmf', [2 4 6 8]);
a = addmf(a, 'output', 1, 'high', 'trapmf', [6 8 10 10]);

% m inputs and n outputs, must have m+n+2 columns in rule list
% first m columns are indexes to member funcs for cooresponding input(s)
% next n columns are indexes to member funcs for cooresponding output(s)
% m + n + 1 column is the weight applied to each rule (usually 1)
% m + n + 2 column is a 1 for AND or a 2 for OR
ruleList = [		% inc	+ age	= aversion
	1 1 2 1 1		% low	+ yng	= med
	1 2 3 1 1		% low	+ avg	= low
	1 3 3 1 1		% low	+ old	= low
	2 1 1 1 1		% med	+ yng	= high
	2 2 2 1 1		% med	+ avg	= med
	2 3 3 1 1		% med	+ old	= low
	3 1 1 1 1		% high	+ yng	= high
	3 2 1 1 1		% high	+ avg	= high
	3 3 2 1 1		% high	+ old	= med
			];

a = addrule(a, ruleList);

end