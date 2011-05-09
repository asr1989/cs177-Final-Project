function f = displayFIS(a)
%displayFIS(a) Given a fussy interface system a, displays the surface view
%solution to the system.

m = 1;
n = 3;

subplot(m,n,1), plotmf(a, 'input', 1);
subplot(m,n,2), plotmf(a, 'input', 2);
subplot(m,n,3), plotmf(a, 'output', 1);

figure
plotfis(a)

surfview(a);

end

