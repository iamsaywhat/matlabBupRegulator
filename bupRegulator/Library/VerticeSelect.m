%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  VerticeSelect - ����� ������������ ����� � ������ "�������"
%
%  AMP - ���������� �����, �� ������� ������������� ����
%  BLU - ���������� ����� ������ �������� ���� �������
%  BLD - ���������� ����� ������ ������� ���� ������� 
%  BRU - ���������� ����� ������� �������� ���� ������� 
%  BRD - ���������� ����� ������� �������� ���� �������
%
%  ���������� ����� ������� ������������ �����
%      1 - BLU, 2 - BLD, 3 - BRU, 4 - BRD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Vertice = VerticeSelect(AMP, BLU, BLD, BRU, BRD)
    %% ������� ����������� ����� ����� � "���������� �������"
    D_BLU = DistanceCalculator(AMP,BLU);
    D_BLD = DistanceCalculator(AMP,BLD);
    D_BRU = DistanceCalculator(AMP,BRU);
    D_BRD = DistanceCalculator(AMP,BRD);
    %% ����������� �������� Vertice � ������ �������
    % 1 - ����� �������
    % 2 - ����� ������
    % 3 - ������ �������
    % 4 - ������ ������
    x = [D_BLU, D_BLD, D_BRU, D_BRD]; 
    Vertice = 1;
    for i = 1:1:3
        if x(i+1) < x(Vertice)
            Vertice = i+1;
        end
    end
    Vertice = uint8(Vertice);
end