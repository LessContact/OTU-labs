n = 4;
T0 = 0.87;
K = 0.88;
Ti = 3.2;
T = 0;
Td = Ti / 4;
Tc = Td / 8;

S = poly(0, 's');
W0 = 2 / (1 + S * T0)^n;
Wl = (1 + 1 / (Ti * S) + ((Td * S) / (1 + Tc * S)) ) * K * W0;
W = Wl / (1 + Wl);

timeStep = 0.001

sl = syslin('c', W);
dMat = dscr(sl, timeStep);

Ad = dMat.A;

I = eye(Ad);

Hd = lyap(Ad, -I, 'd');

eig_H = spec(Hd);

if min(real(eig_H)) <= %eps then
    disp("Матрица H не положительно определена!");
    abort;
end

kappa = max(eig_H) * timeStep;
disp("kappa:");
disp(kappa);
