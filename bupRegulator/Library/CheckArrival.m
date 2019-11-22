%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CheckArrival - Проверка прибытия в точку с координатами "To"
% Now    - Текущие координаты
% To     - Координаты точки приземления
% Radius - Радиус зоны попадания, м
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function status = CheckArrival (Now, To, Radius)
    %% Вычитаем коррдинаты и берем модуль
    %dif = (To - Now);
    %distance = sqrt(dif(1)^2 + dif(2)^2);
    %% Вычисляем расстояние с помощью DistanceCalculator
    distance = DistanceCalculator (Now, To);
    %% Попаданием будем считать радиус 
    if distance < Radius
        status = 1;
    else
        status = 0;
    end
end