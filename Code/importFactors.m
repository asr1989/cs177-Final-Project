% File must be CSV format and must be in the current working directory
% file = input('Please input the name of the file you wish to analyze: ', 's');
fileToRead1 = strcat(pwd, '/', 'IndustryPortfolios', '.csv'); 

DELIMITER = ',';
HEADERLINES = 12;

% Import the file
newData1 = importdata(fileToRead1, DELIMITER, HEADERLINES);

% Create new variables in the base workspace from those fields.
for i = 1:size(newData1.colheaders, 2)
    assignin('base', genvarname(newData1.colheaders{i}), newData1.data(:,i));
end


Cnsmr = Cnsmr/100;
Manuf = Manuf/100;
HiTec = HiTec/100;
Hlth = Hlth/100;
Other = Other/100;

% Everything is annualized

Returns = [mean(Cnsmr) mean(Manuf) mean(HiTec) mean(Hlth) mean(Other)]*12;

Variance = [var(Cnsmr) var(Manuf) var(HiTec) var(Hlth) mean(Other)]*12;

StdDev = [std(Cnsmr) std(Manuf) std(HiTec) std(Hlth) std(Other)]*sqrt(12);

Covariance = cov([Cnsmr Manuf HiTec Hlth Other])*12;

Correlation = corrcoef([Cnsmr Manuf HiTec Hlth Other]);