function [winwForce, windAngle] = WindEstimator(groundSpeedModule0, groundSpeedCourse0, groundSpeedModule1, groundSpeedCourse1, airSpeed)
%% ��������� �������� ��������
groundSpeedX0 = groundSpeedModule0 * cos(pi/2 - groundSpeedCourse0);
groundSpeedY0 = groundSpeedModule0 * cos(- groundSpeedCourse0);
%% ��������� �������� ��������
groundSpeedX1 = groundSpeedModule1 * cos(pi/2 - groundSpeedCourse1);
groundSpeedY1 = groundSpeedModule1 * cos(- groundSpeedCourse1);
%% ���������� ���������� ����� �������
D = sqrt((groundSpeedX1 - groundSpeedX0)^2 + (groundSpeedY1 - groundSpeedY0)^2);
if(D > 2*airSpeed || D < 0.5 || isnan(D))
    %% ������� ����������, ���������� �� ������������
    winwForce = 0;
    windAngle = 0;
else
    %% ������� a ������ �� ���� ������������� �������������
    %a = (app.airSpeed^2 - app.airSpeed^2 + D^2)/(2*D);
    a = (D^2)/(2*D);
    %% ������ ������������� �������������
    h = sqrt(airSpeed^2 - a^2);
    %% ���������� �����, ������� ����� ����� ������� D �� a � b 
    Xh = groundSpeedX0 + a*(groundSpeedX1-groundSpeedX0)/D;
    Yh = groundSpeedY0 + a*(groundSpeedY1-groundSpeedY0)/D;
    %% ��������� ����� ����������� �����������
    P1x = Xh + h*(groundSpeedY1-groundSpeedY0)/D;
    P1y = Yh - h*(groundSpeedX1-groundSpeedX0)/D;
    P2x = Xh - h*(groundSpeedY1-groundSpeedY0)/D;
    P2y = Yh + h*(groundSpeedX1-groundSpeedX0)/D;
    %% ����� ����� ������� ���� �� ���� �����
    %% 1) ����� ��������, ��� ��������� � ������ ��������� � �������� ��
    % groundSpeed0, ������� ������������ ������� ��������� ���, ����� ��� X
    % ���� ������������ � �������� groundSpeed0, � ������� �� �����, �������
    % ������ �� ������� ������ � �������� �� ����� ��� X
    % probX1 = app.P1x*cos(absoluteAngle) + app.P1y*sin(absoluteAngle); 
    % probX2 = app.P2x*cos(absoluteAngle) + app.P2y*sin(absoluteAngle);
    % if(abs(probX1) < abs(probX2))
    %     Px = P1x;
    %     Py = P1y;
    % else
    %     Px = P2x;
    %     Py = P2y;
    % end
    %% 2) ����� ��������, ��� ��������� � ������ ��������� (����������� �����)
    if (sqrt(P1x^2 + P1y^2) < sqrt(P2x^2 + P2y^2))
        Px = P1x;
        Py = P1y;
    else
        Px = P2x;
        Py = P2y;
    end
    %% ����������� �������������� �����
    winwForce = sqrt(Px^2 + Py^2);
    windAngle = Heading([Py, Px], [0 0], 0);
end