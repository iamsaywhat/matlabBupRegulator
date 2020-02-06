%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% wherePoint - ����������� �������, �� ������� �� ������� ��������� �����
% ���������:
%           initialVectorPoint - ���������� ������ �������
%           endVectorPoint     - ���������� ����� �������
%           point              - ���������� �����
% ����������:
%           1 - ���� ����� point ��������� ����� �� �������;
%          -1 - ���� ����� point ��������� ������ �� �������;
%           0 - ���� ����� point ����� �� �������.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function status = wherePoint(initialVectorPoint, endVectorPoint, point)
    %% ��������� ����������
    ax = initialVectorPoint(2); 
    ay = initialVectorPoint(1);
    bx = endVectorPoint(2);
    by = endVectorPoint(1);
    px = point(2);
    py = point(1);
    %% ��������� ���������� ���� ��������:
    % ab ������, ������������ ������� ���������� ��������� �����
    % ap ��������������� ������ ����������� �� ���� �� ������ � ������ �
    % ����� p;
    vectorMul = (bx-ax)*(py-ay)-(by-ay)*(px-ax);
    if vectorMul > 0
        status = 1;
    elseif vectorMul < 0
        status = -1;
    else
        status = 0;
    end
end