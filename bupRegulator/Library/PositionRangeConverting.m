%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PositionRangeConverting - Проверка корректности сферических координат 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function OutputPoint = PositionRangeConverting(InputPoint)
    %% Контроль пределов Координат
    % InputPoint(1) - Широта
    % InputPoint(2) - Долгота
    % InputPoint(3) - Высота
    OutputPoint = InputPoint;
    %% Преобразование Долготы
    if OutputPoint(2) > 180
        OutputPoint(2) = OutputPoint(2) - 360;
    elseif OutputPoint(2) < (-180)
        OutputPoint(2) = OutputPoint(2) + 360;
    end
end