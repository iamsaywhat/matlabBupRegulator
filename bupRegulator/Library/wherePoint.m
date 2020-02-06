%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% wherePoint - ќпределение стороны, по которую от вектора находитс€ точка
% ѕараметры:
%           initialVectorPoint -  оординаты начала вектора
%           endVectorPoint     -  оординаты конца вектора
%           point              -  оординаты точки
% ¬озвращает:
%           1 - ≈сли точка point находитс€ слева от вектора;
%          -1 - ≈сли точка point находитс€ справа от вектора;
%           0 - ≈сли точка point лежит на векторе.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function status = wherePoint(initialVectorPoint, endVectorPoint, point)
    %% ќбозначим переменные
    ax = initialVectorPoint(2); 
    ay = initialVectorPoint(1);
    bx = endVectorPoint(2);
    by = endVectorPoint(1);
    px = point(2);
    py = point(1);
    %% “ребуетс€ построение двух векторов:
    % ab вектор, относительно которой определ€ем положение точки
    % ap вспомогательный вектор проведенный из того же начала с концом в
    % точке p;
    vectorMul = (bx-ax)*(py-ay)-(by-ay)*(px-ax);
    if vectorMul > 0
        status = 1;
    elseif vectorMul < 0
        status = -1;
    else
        status = 0;
    end
end