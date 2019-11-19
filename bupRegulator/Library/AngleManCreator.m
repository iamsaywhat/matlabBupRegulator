%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AngleManCreator - �������� ����� �������� ������ �� ��� ������� �� ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [AMP1, AMP2] = AngleManCreator(Initial_point, TDP, Angle)
    %% ����������� ����������
    % AMP - ���������� �������� ������
    %% ��� ����� �������� ������ ����������� �� ��������������� ������������
    x1 = Initial_point(2);
    y1 = Initial_point(1);
    x2 = TDP(2);
    y2 = TDP(1);
    % ������� �������� ���������� �� ����� ������� � ������� ���� ������ ��
    dx = (x2-x1)/2;
    dy = (y2-y1)/2;
    % ���������� ������ �����
    x3 = dx*cos(Angle*pi/180) - dy*sin(Angle*pi/180)+x1;
    y3 = dx*sin(Angle*pi/180) + dy*cos(Angle*pi/180)+y1;
    AMP1 = [y3;x3;0];
    % ���������� ������ �����
    x4 = dx*cos(-Angle*pi/180) - dy*sin(-Angle*pi/180)+x1;
    y4 = dx*sin(-Angle*pi/180) + dy*cos(-Angle*pi/180)+y1;
    AMP2 = [y4;x4;0];
    %% �������� ����� ����� �� ������� ���������
    AMP1 = PositionRangeConverting(AMP1);
    AMP2 = PositionRangeConverting(AMP2);
end