%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   ����� ������������������
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = DeadZone(u)
if abs(u) < 20
    y = 0;
else
    y = u;
end
% if u > 10
%     y = 50;
% elseif u < - 10
%     y = -50;
% else
%     y = 0;
% end