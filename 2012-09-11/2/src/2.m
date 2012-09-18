function [] = Main()

[a t] = MonteCarlo4(10);
fprintf(1, '%f, %f\n', a, t);
[a t] = MonteCarlo4(100);
fprintf(1, '%f, %f\n', a, t);
[a t] = MonteCarlo4(1000);
fprintf(1, '%f, %f\n', a, t);
[a t] = MonteCarlo4(10000);
fprintf(1, '%f, %f\n', a, t);

quit

function [p, t] = MonteCarlo4(n)
tic;

rand('twister', 0);

x = zeros(1, n);
y = zeros(1, n);
r = zeros(1, n);

x = rand(1, n);
y = rand(1, n);

r = x.^2 + y.^2;


m = (r < 1);
m = sum(m);

p = 4*m/n;
t = toc;
