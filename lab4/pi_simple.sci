clf();
n = 4;
T0 = 0.87;
// K = 1.96 * 0.45;
K = 0.6
// Ti = 5.493 / 1.2;
Ti = 3.4
T = 0;

S = poly(0, 's');
W0 = 2 / (1 + S * T0)^n;
Wl = (1 + 1 / (Ti * S)) * K * W0;
W = Wl / (1 + Wl);

density = 100;
timeStep = 1/density;

sl = syslin('c', W);
dMat = dscr(sl, timeStep);

timePoints = [0:timeStep:100];
stateVector = zeros(size(dMat.A,1),1);
output = zeros(timePoints);
for i=1:length(timePoints)
    stateVector = dMat.A * stateVector + dMat.B;
    output(i) = dMat.C * stateVector;
end

data = fscanfMat("PI_1000.TNO");
figure(0);
subplot(3,1,1);
plot(timePoints, output,'blue');
plot(data(:, 1), data(:, 2), 'red');

y = data(:,2);
err = 0;
for l=2:length(output)
    stepRef = data(2,1) - data(1,1);
    idx = round(timePoints(l) / stepRef) + 1;
    idx = min(idx, length(y));
    err = err + (y(idx) - output(l))^2;
end
err = sqrt(err/length(timePoints));

disp(err);
