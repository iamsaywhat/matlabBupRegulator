%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EntryAngleMan - ����������� ����������� ����� ����� � ������� �����
% AM1            - ����� �������� ������ 1
% AM2            - ����� �������� ������ 2
% Position       - ������� ����������
% TrackingCourse - ������� ����
%
% ���������� ���� �� ����� (AM1 ��� AM2) � ����������� �� �������������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function point = EntryAngleMan (AM1, AM2, Position, TrackingCourse)
    %% ��������� ���� �� ����� ������
    Course1 = CourseCalculator(AM1, Position);
    Course2 = CourseCalculator(AM2, Position);
    %% ����� ������� � �������
    Course1 = Course1 - TrackingCourse;
    Course2 = Course2 - TrackingCourse;
    %% �������� ������������ �������
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
    %% ������ ������ ��� ���������
    Course1 = abs(Course1);
    Course2 = abs(Course2);
    %% ����� ������� ����� �� ������� ������� ������
    if Course1 < Course2
        point = AM1;
    else
        point = AM2;
    end
end