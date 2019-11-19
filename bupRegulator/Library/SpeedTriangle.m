%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   ������ ���������� ����� �� �������������� ������������ ���������
%
%   �����������:
%   TrueAirspeed - �������� ��������� ��������
%   GroundSpeed - �������� ������������ �����
%   Heading - ����������� ���������� ���
%   Track - ������� ����
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [WindForce, WindAngle, WindX, WindY] = SpeedTriangle(TrueAirspeed, GroundSpeed, Heading, Track)
    %% ���������� �������� ������� ��������� ��������
    TrueAirspeedX = TrueAirspeed * cos(pi/2 - Heading);
    TrueAirspeedY = TrueAirspeed * cos(- Heading);
    %% ���������� �������� ������� ������� ��������
    GroundSpeedX = GroundSpeed * cos(pi/2 - Track);
    GroundSpeedY = GroundSpeed * cos(- Track);
    %% ���������� �������� ������� �����
    WindX = -(TrueAirspeedX - GroundSpeedX);
    WindY = -(TrueAirspeedY - GroundSpeedY);
    %% ���������� ������ ������� �����
    powY = WindY*WindY;
    powX = WindX*WindX;
    WindForce = sqrt(powX + powY);
    %% ������ ����������� �����
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