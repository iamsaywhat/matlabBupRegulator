%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   ParseFileByTags - ������ ������. �������� � ��������� �������� 
%   �������� �� ����� "file", �� ������ ����� list.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function parse_result = ParseFileByTags (file, list)
    
    % �������� ������ ����� �� ������������
    listsize = size(list);
    if listsize(2) ~= 1
        error('Second argument is incorrect')
    end
    % ������ ���������� �����
    tag_num = size(list);
    tag_num = tag_num(1);
    % ������ ������ ��������
    for i = 1 : 1 : tag_num
        parse_result{i} = [];
    end
    % �������� ��������� ������ �� �������, ���� �� ��������� ����� �����
    while ~feof(file)
        % ����� ������ �� �����
        line = fgets(file);
        % ����������� ������, ����������� � ������ �����
        for i = 1:1:tag_num
            % �������� ������ ��������
            temp_line = line;
            % ��� �������� ���� ������ ������ (�� ������� ������������)
            % ���� ��������� �����
            temp_line = findNdelete(temp_line, list{i});
            % ����� ��� ��� ��� ���������
            if ~strcmp (temp_line, '')
                % ���� �� ������ ������, �� ��������� ������ �������� 
                % ���������������� ���������
                res = str2double(temp_line);
                if isnan(res)
                    res = 0;
                end
                parse_result{i} = [parse_result{i}; res];
            end
        end
    end
end