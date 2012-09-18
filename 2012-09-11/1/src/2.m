function [] = Main()

[a t] = MonteCarlo2(10);
fprintf(1, '%f, %f\n', a, t);
[a t] = MonteCarlo2(100);
fprintf(1, '%f, %f\n', a, t);
[a t] = MonteCarlo2(1000);
fprintf(1, '%f, %f\n', a, t);
[a t] = MonteCarlo2(10000);

quit

function [p, t] = MonteCarlo2(n)
tic;

rand('twister', 0);

x = zeros(1, n);
y = zeros(1, n);
r = zeros(1, n);

for i=1:n
	x(i) = rand();
	y(i) = rand();
end

for i=1:n
	r(i) = x(i)^2 + y(i)^2;
end

m = 0;
for i=1:n
	if r(i) <= 1
		m = m + 1;
	end
end

p = 4*m/n;
t = toc;

