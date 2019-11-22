%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DistanceCalculator - ���������� ����������� �� Position �� Target 
% � ������ �� ����������� �����������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = DistanceCalculator (Position, Target)
    %% �������� ���������� (����� �������)
    % dif = (TDP - ActualPoint);
    % % ��������� �������� �� ��� � ��������� � ��.
    % distance_lon2x = dif(1)*40000/360*cos(dif(2)*pi/180);
    % distance_lat2y = dif(2)*40000/360;
    % distance = sqrt(distance_lon2x^2 + distance_lat2y^2);
    %% �������� ���������� (����� �������������)
    la1 = Position(2)*pi/180;
    fi1 = Position(1)*pi/180;
    la2 = Target(2)*pi/180;
    fi2 = Target(1)*pi/180;
    d = sin(fi1)*sin(fi2) + cos(fi1)*cos(-fi2)*cos(la2-la1);
    % 6371 �� ������� ������ �����
    y = acos(d)*6378245;
end