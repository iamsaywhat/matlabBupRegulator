%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PositionRangeConverting - �������� ������������ ����������� ��������� 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function OutputPoint = PositionRangeConverting(InputPoint)
    %% �������� �������� ���������
    % InputPoint(1) - ������
    % InputPoint(2) - �������
    % InputPoint(3) - ������
    OutputPoint = InputPoint;
    %% �������������� �������
    if OutputPoint(2) > 180
        OutputPoint(2) = OutputPoint(2) - 360;
    elseif OutputPoint(2) < (-180)
        OutputPoint(2) = OutputPoint(2) + 360;
    end
end