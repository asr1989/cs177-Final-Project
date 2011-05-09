Returns = [.07259   .10129  .07419  .06093;
           .16886   .07057  .14927  .01905;
           .09228   .05311  .07904  .03187;
           .12179   .11491  .04984  .02653;
           .28065   .15554  .04833  .14643;
           .01678   .13460  .05526  .03763;
           .05662   .03706  .03615  .05968;
           .19837   .06447  .04819  .02454;
           .08737   .05189  .06642  .06856;
           .18244   .14810  .03827  .06003;];

ExpReturns = mean(Returns,1)

StdDev = std(Returns)

Covariance = cov(Returns)

portrand(Returns, ExpReturns, 5000)
hold on;
plot(StdDev(1), ExpReturns(1), 'sk')
plot(StdDev(2), ExpReturns(2), 'sk')
plot(StdDev(3), ExpReturns(3), 'sk')
plot(StdDev(4), ExpReturns(4), 'sk')
hold off;

frontcon(ExpReturns, Covariance, 500)

fis = buildFIS()
evaluateFIS(45, 20, fis)
evaluateFIS(50, 65, fis)

[PortRisk, PortReturn, PortWts] = frontcon(ExpReturns, Covariance);
[RiskyRisk, RiskyReturn, RiskyWts, RiskyFraction, OverallRisk, OverallReturn] = ...
    portalloc(PortRisk, PortReturn, PortWts, .02, NaN, 8.3077);
fprintf('The composition of the complete portfolios is:\n\ta = %5.3f%%\n\tb = %5.3f%%\n\tc = %5.3f%%\n\td = %5.3f%%\n\trisk-free = %5.3f%%\n', ...
    RiskyFraction*RiskyWts(1)*100, RiskyFraction*RiskyWts(2)*100, RiskyFraction*RiskyWts(3)*100, RiskyFraction*RiskyWts(4)*100, ...
    (1 - RiskyFraction)*100)
fprintf('The expected return of the complete portfolio is %5.3f%%\n', OverallReturn*100)
fprintf('The standard deviation of the complete portfolio is %5.3f%%\n', OverallRisk*100)