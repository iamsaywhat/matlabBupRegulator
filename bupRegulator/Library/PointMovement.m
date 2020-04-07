%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   PointMovement - ����������� �� ����� Position �� ���������� 
%   DistanceM (�����) � ����������� ������������ ������ Bearing
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function NPoint = PointMovement(Position, DistanceM, Bearing)
    %% ���������� ������� ����������
    AngularDistance = DistanceM/6378160;
    %% ���������� � �������
    Lat1 = Position(1)/180*pi;
    Lon1 = Position(2)/180*pi;
    %% �������� ���������� ����� �����������
    Lat2 = asin(sin(Lat1)*cos(AngularDistance) + cos(Lat1)*sin(AngularDistance)*cos(Bearing));
    Lon2 = Lon1 + atan2(sin(Bearing)*sin(AngularDistance)*cos(Lat1), cos(AngularDistance)-sin(Lat1)*sin(Lat2));
    %% ��������� � �������
    Lat2 = Lat2/pi*180;
    Lon2 = Lon2/pi*180;
    NPoint = [Lat2, Lon2, Position(3), Position(4)];
end    