function [] = Main()

[a t] = MonteCarlo3(10);
fprintf(1, '%f, %f\n', a, t);
[a t] = MonteCarlo3(100);
fprintf(1, '%f, %f\n', a, t);
[a t] = MonteCarlo3(1000);
fprintf(1, '%f, %f\n', a, t);
[a t] = MonteCarlo3(10000);
fprintf(1, '%f, %f\n', a, t);

quit

function [p, t] = MonteCarlo3(n)
tic;

rand('twister', 0);

x = zeros(1, n);
y = zeros(1, n);
r = zeros(1, n);

x = rand(1, n);
y = rand(1, n);

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
