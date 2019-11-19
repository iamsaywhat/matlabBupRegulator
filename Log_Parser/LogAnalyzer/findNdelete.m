%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   findNdelete - ����� � �������� � ������ sourse ���������� �� find,
%   ������� ���, � ������� \n
%   � ����� ������ ������ ����:
%   "[���-�����][�������� ����������]\n"
%       ���-����� - ��������� �����, �� �������� ����� ����� � ������ (�����)
%   ��������� �� ��� ����������
%       �������� ���������� - ����� ������� ���������� �������;
%   \n - ������� ������, ������� ���������� ������;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function result = findNdelete (source, find)
  
  findsize = size(find);
  if findsize(1) ~= 1
      error('Second argument is incorrect')
  end
  
  sourcesize = size(source);
  if sourcesize(1) ~= 1
       error('First argument is incorrect')
  end
  
  % ����� ����� ������
  findsize = findsize(2);
  
  % ��������� ��������� find � ������ findsize �������� source
  if strncmp(find, source, findsize)
      % �������� find �� source
      result = strrep(source, find, '');
      % �������� \n �� source
      result = strrep(result, '\n', '');
  else
      % ��������� ����������, ���������� "�����"
      result = '';
  end
end