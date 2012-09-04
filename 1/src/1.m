clear all
hold on

n = 10000;
m = 0;

rand('twister' ,0);
for i = 1:n
	x(i) = rand();
	y(i) = rand();

	if x(i)^2 + y(i)^2 <= 1
		m = m + 1;
	end
end

p = plot(x, y, 'bs');
rectangle('Curvature', [1, 1], 'EdgeColor', 'r', 'LineWidth', 10);

saveas(p, 'hoge.jpg', 'jpg');

10000

quit
%$ 4*m/n
