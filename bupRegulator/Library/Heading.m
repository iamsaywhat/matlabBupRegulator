%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Heading - ���������� �����
%   u0 - ���������� ����� ������������, ������� ���������
%   u1 - ���������� ����� ���� �� �������, ���������
%   last_y - ����������� �������� � ������, ���� ������ �� ������
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = Heading(u1, u0, last_y)
    %% ���������, ��� ���������� ����������
    un = u1 - u0;
    d_lat = un(1);
    d_lon = un(2);
    %% ������� ��� ����������� ����������� ���� � ������ ��������� �����
    % ����������� 0 � 180 �� �������
    if d_lon > 180
        d_lon = d_lon - 360;
    elseif d_lon < (-180)
            d_lon = d_lon +360;
    end
    %% ������ �����
    un_pow1 = d_lat*d_lat;
    un_pow2 = d_lon*d_lon;
    if (un_pow1 < 1e-16) && (un_pow2 < 1e-16)
        y = last_y;
    else
        x = acos( d_lon / (sqrt(un_pow2 + un_pow1)));
        y = acos( d_lat / (sqrt(un_pow2 + un_pow1)));
        if x > pi/2
            y = 2*pi - y;
        end
    end
end