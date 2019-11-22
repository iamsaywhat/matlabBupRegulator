%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   PointMovementPlot - Отрисовка перемещения из точки Position на 
%   расстояние DistanceM (метры) в направлении относительно севера Bearing
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function PointMovementPlot(Position, DistanceM, Bearing)
    %% Рассчитаем угловое расстояние
    AngularDistance = DistanceM/6378160;
    %% Координаты в радианы
    Lat1 = Position(1)/180*pi;
    Lon1 = Position(2)/180*pi;
    %% Получаем координаты точки перемещения
    Lat2 = asin(sin(Lat1)*cos(AngularDistance) + cos(Lat1)*sin(AngularDistance)*cos(Bearing));
    Lon2 = Lon1 + atan2(sin(Bearing)*sin(AngularDistance)*cos(Lat1), cos(AngularDistance)-sin(Lat1)*sin(Lat2));
    %% Переводим в градусы
    Lat2 = Lat2/pi*180;
    Lon2 = Lon2/pi*180;
    %% Визуализация
    %% Окружность
    figure(66)
    R = 100/1000*360/40000;
    plot(Position(2) + R * cos(0:0.001:2*pi), Position(1) + R * sin(0:0.001:2*pi));
    hold on
    R = 200/1000*360/40000;
    plot(Position(2) + R * cos(0:0.001:2*pi), Position(1) + R * sin(0:0.001:2*pi));
    hold on
    R = 300/1000*360/40000;
    plot(Position(2) + R * cos(0:0.001:2*pi), Position(1) + R * sin(0:0.001:2*pi));
    hold on
    R = 450/1000*360/40000;
    plot(Position(2) + R * cos(0:0.001:2*pi), Position(1) + R * sin(0:0.001:2*pi));
    hold on
    plot([Position(2), Lon2], [Position(1), Lat2]);
    grid on
    hold off
end    