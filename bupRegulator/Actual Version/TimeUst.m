RotationSpeed = 7;
angle = 0 : 1 : 180;

a = 0.1;
b = 0.2;
c = 1;

Linear = angle./RotationSpeed;

plot(angle, Linear), grid on

Quadratic = a*angle.^2 + b*angle + c;

hold on

plot(angle, Quadratic), grid on

hold off
