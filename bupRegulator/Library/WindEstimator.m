function [winwForce, windAngle] = WindEstimator(groundSpeedModule0, groundSpeedCourse0, groundSpeedModule1, groundSpeedCourse1, airSpeed)
%% Вычисляем проекции векторов
groundSpeedX0 = groundSpeedModule0 * cos(pi/2 - groundSpeedCourse0);
groundSpeedY0 = groundSpeedModule0 * cos(- groundSpeedCourse0);
%% Вычисляем проекции векторов
groundSpeedX1 = groundSpeedModule1 * cos(pi/2 - groundSpeedCourse1);
groundSpeedY1 = groundSpeedModule1 * cos(- groundSpeedCourse1);
%% Определяем расстояние между точками
D = sqrt((groundSpeedX1 - groundSpeedX0)^2 + (groundSpeedY1 - groundSpeedY0)^2);
if(D > 2*airSpeed || D < 0.5 || isnan(D))
    %% Решение отсутсвует, окружности не пересекаются
    winwForce = 0;
    windAngle = 0;
else
    %% Сторона a одного из двух прямоугольных треугольников
    %a = (app.airSpeed^2 - app.airSpeed^2 + D^2)/(2*D);
    a = (D^2)/(2*D);
    %% Высота прямоугольных труегольников
    h = sqrt(airSpeed^2 - a^2);
    %% Координаты точки, которая делит общую сторону D на a и b 
    Xh = groundSpeedX0 + a*(groundSpeedX1-groundSpeedX0)/D;
    Yh = groundSpeedY0 + a*(groundSpeedY1-groundSpeedY0)/D;
    %% Координты точек пересечения окружностей
    P1x = Xh + h*(groundSpeedY1-groundSpeedY0)/D;
    P1y = Yh - h*(groundSpeedX1-groundSpeedX0)/D;
    P2x = Xh - h*(groundSpeedY1-groundSpeedY0)/D;
    P2y = Yh + h*(groundSpeedX1-groundSpeedX0)/D;
    %% Здесь нужно выбрать одну из двух точек
    %% 1) Будем выбирать, как ближайшую к началу координат в проекции на
    % groundSpeed0, поэтому поворачиваем систему коопдинат так, чтобы ось X
    % была соноправлена с вектором groundSpeed0, и выберем ту точку, которая
    % вектор до которой короче в проекции на новую ось X
    % probX1 = app.P1x*cos(absoluteAngle) + app.P1y*sin(absoluteAngle); 
    % probX2 = app.P2x*cos(absoluteAngle) + app.P2y*sin(absoluteAngle);
    % if(abs(probX1) < abs(probX2))
    %     Px = P1x;
    %     Py = P1y;
    % else
    %     Px = P2x;
    %     Py = P2y;
    % end
    %% 2) Будем выбирать, как ближайшую к началу координат (минимальная длина)
    if (sqrt(P1x^2 + P1y^2) < sqrt(P2x^2 + P2y^2))
        Px = P1x;
        Py = P1y;
    else
        Px = P2x;
        Py = P2y;
    end
    %% Расчитываем характеристики ветра
    winwForce = sqrt(Px^2 + Py^2);
    windAngle = Heading([Py, Px], [0 0], 0);
end