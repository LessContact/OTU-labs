A = [
	5 1 7;
	-10 -2 1;
	0 1 2;
];

B = [
	2 4 1;
	3 1 0;
	7 2 1;
];

D = 2*(A - B)*((A^2)+B);

detD = det(D);
if detD ~= 0 then
    invD = inv(D)
    disp(invD)
    disp(invD*D)
else
    disp("singular matrix")
end
