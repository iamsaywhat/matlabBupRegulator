%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BOXCreator - �������� ������� ����� ���������� ������� "�������"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [BLU, BLD, BRU, BRD] = BOXCreator(TDP, BoxStep)
    %% ����������� ����������
    % BLU - ���������� ������� ����� ����� ��������
    % BLD - ���������� ������ ����� ����� ��������
    % BRU - ���������� ������� ������ ����� ��������
    % BRD - ���������� ������ ������ ����� ��������
    %% ����������� ����� ��������
    BLU=[0; 0; 0]; BLD = [0; 0; 0]; BRU = [0; 0; 0]; BRD=[0; 0; 0];
    % ��������� ��� � �������� �� ������ (���������� ��������������)
    LatStep = BoxStep/1000*360/40000;
    % ���������� �� ������
    BLU(1) = TDP(1) + LatStep;
    BLD(1) = TDP(1) - LatStep; 
    BRU(1) = TDP(1) + LatStep;
    BRD(1) = TDP(1) - LatStep; 
    % ��������� ��� �� ������� ��� ����� �������� �� ������ (������� ������� ��
    % ������), � �������� �� ������ ����� ������ ����� � ���������
    LonStep = BoxStep/1000*360/40000;
    % ���������� �� �������
    BLU(2) = TDP(2) - LonStep/cos(pi*BLU(1)/180);
    BLD(2) = TDP(2) - LonStep/cos(pi*BLD(1)/180);
    BRU(2) = TDP(2) + LonStep/cos(pi*BRU(1)/180);
    BRD(2) = TDP(2) + LonStep/cos(pi*BRD(1)/180);
    %% �������� ����� ����� �� ������� ���������
    BLU = PositionRangeConverting(BLU);
    BLD = PositionRangeConverting(BLD);
    BRU = PositionRangeConverting(BRU);
    BRD = PositionRangeConverting(BRD);
end
    

