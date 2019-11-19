%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CheckFinalMane - Проверка необходимости перехода к финальному манёвру
%
% Использует глобальные переменные:
%    ActualPoint - Текущие координаты
%    TDPoint     - Координаты точки приземления
%    V_hor       - Горизонтальная скорость полета (м/с)
%    V_ver       - Скорость снижения (м/c)
%    Course      - Путевой курс
%    Course2TDP  - Курс (азимут) до точки приземления
%    ReliefOnTDP - Высота рельефа над точкой приземления
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function status = CheckFinalMane ()
    %% Вычислим расстояние с помощью функции DistanceCalculator()
    Distance = DistanceCalculator(ActualPoint, TDPoint);
    %% Вычисляем время необходимое для преодоления расстояния до TDP и до посадки
    T_hor = Distance/V_hor;
    T_ver = (ActualPoint(3) - (TDPoint(3) + double(ReliefOnTDP)))/V_ver;
    %% Определяем поправку по времени необходимому на разворот
    % Угол разворота
    angle = abs(Course2TDP-Course) * 180 / pi;
    if angle > 180
        angle = angle - 180;
    end

    % Вычисляем поправку как линейную функцию: 
    T_hor_popr = angle / TurnSpeed;

    % Вычисляем поправку по параболе
    %T_hor_popr = 0.003*angle^2 + 0.008*angle;

    T_hor = T_hor + T_hor_popr;
    %% Возвращаем сигнал о необходимости перейти на финальный маневр
    if T_hor > T_ver
        status = 1;
    else
        status = 0;
    end
end