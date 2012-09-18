function [] = Main()

[a t] = MonteCarlo(10);
fprintf(1, '%f, %f\n', a, t);
[a t] = MonteCarlo(100);
fprintf(1, '%f, %f\n', a, t);
[a t] = MonteCarlo(1000);
fprintf(1, '%f, %f\n', a, t);

quit

function [p, t] = MonteCarlo(n)
tic;

rand('twister', 0);

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
%fprintf(1, 'pi is %f\n', p);
%fprintf(1, 'time is %f\n', time);


