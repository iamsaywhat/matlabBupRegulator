%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   ������ � ���������� �������������� ������������ ���������
%
%   �����������:
%   TrueAirspeed - �������� ��������� ��������
%   GroundSpeed - �������� ������������ �����
%   Heading - ����������� ���������� ���
%   Track - ������� ����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function SpeedTrianglePlot(TrueAirspeed, GroundSpeed, Heading, Track)
    %% ���������� �������� ������� ��������� ��������
    TrueAirspeedX = TrueAirspeed * cos(pi/2 - Heading);
    TrueAirspeedY = TrueAirspeed * cos(- Heading);
    %% ���������� �������� ������� ������� ��������
    GroundSpeedX = GroundSpeed * cos(pi/2 - Track);
    GroundSpeedY = GroundSpeed * cos(- Track);
    %% ���������� �������� ������� �����
    WindX = -(TrueAirspeedX - GroundSpeedX);
    WindY = -(TrueAirspeedY - GroundSpeedY);
    %% ������������
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