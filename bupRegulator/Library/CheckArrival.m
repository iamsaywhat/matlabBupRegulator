%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CheckArrival - �������� �������� � ����� � ������������ "To"
% Now    - ������� ����������
% To     - ���������� ����� �����������
% Radius - ������ ���� ���������, �
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function status = CheckArrival (Now, To, Radius)
    %% �������� ���������� � ����� ������
    %dif = (To - Now);
    %distance = sqrt(dif(1)^2 + dif(2)^2);
    %% ��������� ���������� � ������� DistanceCalculator
    distance = DistanceCalculator (Now, To);
    %% ���������� ����� ������� ������ 
    if distance < Radius
        status = 1;
    else
        status = 0;
    end
end