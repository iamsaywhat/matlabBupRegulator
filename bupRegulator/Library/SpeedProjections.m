%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   SpeedProjections - �������� �������� �������� �������� �� lat, lon, alt
%   � �������������� � ������������ �������� �����
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [V_hor, V_vert] = SpeedProjections(Vel_lat, Vel_lon, Vel_alt)
    V_hor = sqrt(Vel_lat^2 + Vel_lon^2);
    V_vert = abs(Vel_alt);
end