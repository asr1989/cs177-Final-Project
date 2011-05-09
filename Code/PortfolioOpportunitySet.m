[portrisk, portrtn, portwts] = portrand([Cnsmr Manuf HiTec Hlth Other]*sqrt(12), Returns, 5000);

plot(portrisk,portrtn,'.k');
xlabel('Risk (Standard Deviation)');
ylabel('Expected Return');
title('The Portfolio Opportunity Set')

hold on;
plot(StdDev, Returns, '*r');
text(StdDev(1), Returns(1), '  Cnsmr')
text(StdDev(2), Returns(2), '  Manuf');
text(StdDev(3), Returns(3), '  HiTec');
text(StdDev(4), Returns(4), '  Hlth');
text(StdDev(5), Returns(5), '  Other');
grid on;
hold off;