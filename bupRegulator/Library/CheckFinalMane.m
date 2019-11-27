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
    Distance = DistanceCalculator(ActualPoint, TDPoint); %+TDPPopr
    %% ��������� ����� ����������� ��� ����������� ���������� �� TDP � �� �������
    T_hor = Distance/HorizontalVelocity;
    T_ver = (ActualPoint(3) - (TDPoint(3) + double(ReliefOnTDP)))/VerticalVelocity;
    %% ���������� �������� �� ������� ������������ �� ��������
    % ��������� ���� �� ����� �����������
    Course2TDP = Heading(TDPoint, ActualPoint, 0);
    % ���� ���������
    angle = Course2TDP - Course;
    if angle > pi
        angle = angle - 2*pi; 
    end
    if angle < (-pi)
        angle = angle + 2*pi; 
    end
    angle = abs(angle * 180 / pi);

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