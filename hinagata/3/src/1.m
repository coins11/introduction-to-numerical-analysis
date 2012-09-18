function [] = Main()
hold on

x = 1000:9999;

for i=1:9000
	y(i) = abs( MonteCarlo4( x(i) ) - pi );
end

% 通常のグラフ
%plot(x, y);

for i=1:9000
	x(i) = log(x(i));
end

% xが対数
%plot(x, y);

x = 1000:9999;

for i=1:9000
	y(i) = log(y(i));
end

% yが対数
%plot(x, y);

for i=1:9000
	x(i) = log(x(i));
end

% 両方対数
plot(x, y);

function [p] = MonteCarlo4(n)
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
