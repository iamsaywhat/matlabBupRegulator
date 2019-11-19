%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Расчет параметров ветра по навигационному треугольнику скоростей
%
%   Обозначения:
%   TrueAirspeed - Истинная воздушная скорость
%   GroundSpeed - Скорость относительно земли
%   Heading - Направление продольной оси
%   Track - Путевой курс
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [WindForce, WindAngle, WindX, WindY] = SpeedTriangle(TrueAirspeed, GroundSpeed, Heading, Track)
    %% Определяем проекции вектора воздушной скорости
    TrueAirspeedX = TrueAirspeed * cos(pi/2 - Heading);
    TrueAirspeedY = TrueAirspeed * cos(- Heading);
    %% Определяем проекции вектора путевой скорости
    GroundSpeedX = GroundSpeed * cos(pi/2 - Track);
    GroundSpeedY = GroundSpeed * cos(- Track);
    %% Определяем проекции вектора ветра
    WindX = -(TrueAirspeedX - GroundSpeedX);
    WindY = -(TrueAirspeedY - GroundSpeedY);
    %% Определяем модуль вектора ветра
    powY = WindY*WindY;
    powX = WindX*WindX;
    WindForce = sqrt(powX + powY);
    %% Расчет направления ветра
    %% 
    if (powX < 1e-16) && (powY < 1e-16)
        y = 0;
    else
        x = acos( WindX / (sqrt(powX + powY)));
        y = acos( WindY / (sqrt(powX + powY)));
        if x > 1.5708
            y = 6.28319 - y;
        end
    end
    WindAngle = y;
end