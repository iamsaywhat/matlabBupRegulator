%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EntryAngleMan - Определение оптимальной точки входа в угловой манёвр
% AM1            - Точка углового манёвра 1
% AM2            - Точка углового манёвра 2
% Position       - Текущие координаты
% TrackingCourse - Текущий курс
%
% Возвращает одну из точек (AM1 или AM2) в зависимости от оптимальности
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function point = EntryAngleMan (AM1, AM2, Position, TrackingCourse)
    %% Определим курс до точек манёвра
    Course1 = Heading(AM1, Position, 0);
    Course2 = Heading(AM2, Position, 0);
    %% Найдём разницу с путевым
    Course1 = Course1 - TrackingCourse;
    Course2 = Course2 - TrackingCourse;
    %% Проведем нормирование разницы
    if Course1 > pi
        Course1 = Course1 - 2*pi;
    end
    if Course1 < (-pi)
        Course1 = Course1 + 2*pi;
    end
    if Course2 > pi
        Course2 = Course2 - 2*pi;
    end
    if Course2 < (-pi)
        Course2 = Course2 + 2*pi;
    end
    %% Возьмём модуль для сравнения
    Course1 = abs(Course1);
    Course2 = abs(Course2);
    %% Будет выбрана точка до которой поворот меньше
    if Course1 < Course2
        point = AM1;
    else
        point = AM2;
    end
end