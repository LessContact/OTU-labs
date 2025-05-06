u = 0:00.1:4*%pi;
v = 0:00.1:42*%pi;

for i=1:length(u)
	for j=1:length(v)
		x(i, j) = cos(u(i)) * u(i) * (1 + cos(v(j) / 2));
	end
end

for i=1:length(u)
	for j=1:length(v)
		y(i, j) = u(i) * sin(v(j)) / 2;
	end
end

for i=1:length(u)
	for j=1:length(v)
		z(i, j) = sin(u(i)) * u(i) * (1 + cos(v(j) / 2));
	end
end

plot3d2(x, y ,z);
