%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CheckFinalMane - �������� ������������� �������� � ���������� ������
%
% ���������� ���������� ����������:
%    ActualPoint - ������� ����������
%    TDPoint     - ���������� ����� �����������
%    V_hor       - �������������� �������� ������ (�/�)
%    V_ver       - �������� �������� (�/c)
%    Course      - ������� ����
%    Course2TDP  - ���� (������) �� ����� �����������
%    ReliefOnTDP - ������ ������� ��� ������ �����������
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function status = CheckFinalMane ()
    %% �������� ���������� � ������� ������� DistanceCalculator()
    Distance = DistanceCalculator(ActualPoint, TDPoint);
    %% ��������� ����� ����������� ��� ����������� ���������� �� TDP � �� �������
    T_hor = Distance/V_hor;
    T_ver = (ActualPoint(3) - (TDPoint(3) + double(ReliefOnTDP)))/V_ver;
    %% ���������� �������� �� ������� ������������ �� ��������
    % ���� ���������
    angle = abs(Course2TDP-Course) * 180 / pi;
    if angle > 180
        angle = angle - 180;
    end

    % ��������� �������� ��� �������� �������: 
    T_hor_popr = angle / TurnSpeed;

    % ��������� �������� �� ��������
    %T_hor_popr = 0.003*angle^2 + 0.008*angle;

    T_hor = T_hor + T_hor_popr;
    %% ���������� ������ � ������������� ������� �� ��������� ������
    if T_hor > T_ver
        status = 1;
    else
        status = 0;
    end
end