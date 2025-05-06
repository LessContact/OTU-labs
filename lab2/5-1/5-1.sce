s = [1; 1.25; 1.5; 1.75; 2; 2.25; 2.5; 2.75; 3];
Q = [5.21; 4.196; 3.759; 3.672; 4.592; 4.621; 5.758; 7.173; 9.269];

// Create a data matrix with two rows: first row - s, second row - Q
z = [s'; Q'];

function [e] = quad_model(p, z)
    // p(1)=A, p(2)=B, p(3)=C
    e = z(2) - (p(1)*z(1).^2 + p(2)*z(1) + p(3));
endfunction

p0 = [1; 1; 1];

[a, err] = datafit(quad_model, z, p0);

disp("optimal parameters:");
disp(a);
disp("minimum error:");
disp(err);

s_fit = min(s):0.01:max(s);
Q_fit = a(1)*s_fit.^2 + a(2)*s_fit + a(3);

plot(s, Q, "r-");
plot(s, Q, "ro");
plot(s_fit, Q_fit);
legend("Data", "Fitted Curve");
