function f = optimPort(ExpReturn, ExpCovariance, RiskAversion)

    % The risk-free rate
    RiskFreeRate = .01;

    % The number of portfolios to generate
    NumPorts = 100;

    % This represents the efficient frontier
    [PortRisk, PortReturn, PortWts] = frontcon(ExpReturn, ExpCovariance, NumPorts);

    % Calculate the Sharpe ratios
    SharpeRatios = (PortReturn - RiskFreeRate)./PortRisk;

    % Find the optimal risky portfolio
    [RiskyRisk, RiskyReturn, RiskyWts, RiskyFraction, OverallRisk, OverallReturn] = ...
    portalloc(PortRisk, PortReturn, PortWts, RiskFreeRate, NaN, RiskAversion);
    
    fprintf('The weights of the risky portfolio are:\n\tCnsmr = %5.3f%%\n\tManuf = %5.3f%%\n\tHiTec = %5.3f%%\n\tHlth = %5.3f%%\n\tOther = %5.3f%%\n',...
        RiskyWts(1)*100, RiskyWts(2)*100, RiskyWts(3)*100, RiskyWts(4)*100, RiskyWts(5)*100)
    fprintf('The risky portfolio has annual expected return of %5.3f%% and standard deviation of %5.3f%%\n',...
        RiskyReturn*100, RiskyRisk*100)
    fprintf('Based on your risk aversion, you should invest %5.3f%% in the risky portfolio and %5.3f%% in the risk-free asset\n',...
        RiskyFraction*100, (1-RiskyFraction)*100)
    fprintf('The weights of the overall portfolio are:\n\tCnsmr = %5.3f%%\n\tManuf = %5.3f%%\n\tHiTec = %5.3f%%\n\tHlth = %5.3f%%\n\tOther = %5.3f%%\n\tRisk-free asset = %5.3f%%\n',...
        RiskyFraction*RiskyWts(1)*100,RiskyFraction*RiskyWts(2)*100, RiskyFraction*RiskyWts(3)*100, RiskyFraction*RiskyWts(4)*100, RiskyFraction*RiskyWts(5)*100, (1-RiskyFraction)*100)
    fprintf('The complete portfolio has annual expected return of %5.3f%% and standard deviation of %5.3f%%\n\n',...
        OverallReturn*100, OverallRisk*100)

    % Now graph the efficient frontier and optimal risky and complete portfolios
    portalloc(PortRisk, PortReturn, PortWts, RiskFreeRate, NaN, RiskAversion)
    print -dtiff CapitalAllocation % And save a copy as a tiff in the pwd
    
    % And a pie chart showing the composition of the overall portfolio
    figure;
    pie([RiskyFraction*RiskyWts(1),RiskyFraction*RiskyWts(2),RiskyFraction*RiskyWts(3),RiskyFraction*RiskyWts(4), RiskyFraction*RiskyWts(5), (1-RiskyFraction)], {'Cnsmr', 'Manuf', 'HiTec', 'Hlth', 'Other', 'T-Bills'})
    title('Optimal Complete Portfolio Allocation')
    print -dtiff PortfolioAllocationPie % And save a copy as a tiff in the pwd
    
end