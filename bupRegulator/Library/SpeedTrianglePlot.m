%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Расчет и построение навигационного треугольника скоростей
%
%   Обозначения:
%   TrueAirspeed - Истинная воздушная скорость
%   GroundSpeed - Скорость относительно земли
%   Heading - Направление продольной оси
%   Track - Путевой курс
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function SpeedTrianglePlot(TrueAirspeed, GroundSpeed, Heading, Track)
    %% Определяем проекции вектора воздушной скорости
    TrueAirspeedX = TrueAirspeed * cos(pi/2 - Heading);
    TrueAirspeedY = TrueAirspeed * cos(- Heading);
    %% Определяем проекции вектора путевой скорости
    GroundSpeedX = GroundSpeed * cos(pi/2 - Track);
    GroundSpeedY = GroundSpeed * cos(- Track);
    %% Определяем проекции вектора ветра
    WindX = -(TrueAirspeedX - GroundSpeedX);
    WindY = -(TrueAirspeedY - GroundSpeedY);
    %% Визуализация
    figure(55)
    plot([0 TrueAirspeedX], [0 TrueAirspeedY]);
    hold on
    plot([0 GroundSpeedX], [0 GroundSpeedY]);
    hold on
    plot([TrueAirspeedX TrueAirspeedX+WindX], [TrueAirspeedY TrueAirspeedY+WindY]);
    grid on
    hold off
    axis([-30 +30 -30 +30])
end