clear all;
rand('twister',0);

n = 1000;
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

fprintf(1, 'pi is %f\n', p);

quit
