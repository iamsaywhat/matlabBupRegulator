function cell = RepairCellData(cellInput)
    % �������� ����
    cell = cellInput;
    % ����� ������ ������
    cellSize = size(cell);
    % ���� �� ������� ������
    for cellLine = 1 : 1 : cellSize(1)
       % ���� �� �������� ������
       for cellColumn = 1 : 1 : cellSize(2)
           % ��������� ������ �� �������
           if isempty(cell{cellLine,cellColumn})
               % ������ ������ ����������� � ����
               cell{cellLine,cellColumn} = 0;
           else
               % ��� �������� ��� ��������:
               % ���� ������ �� ������ ������, ����� ��� � �������
               % ���� ������ �������, � � ���� ���������� ���������
               
               % ������� ������ ������
               matrSize = size(cell{cellLine,cellColumn});
               % ���� �� ������� ������� ������ ������
               for matrLine = 1 : 1 : matrSize(1)
                  % ���� �� �������� ������� ������ ������
                  for matrColumn =  1 : 1 : matrSize(2)
                     % ������ ������� ������ ����������� � ����
                     if isempty(cell{cellLine,cellColumn}(matrLine, matrColumn))
                         cell{cellLine,cellColumn}(matrLine, matrColumn) = 0;
                     % NAN ������� ������ ����������� � ����
                     elseif isnan(cell{cellLine,cellColumn}(matrLine, matrColumn))
                         cell{cellLine,cellColumn}(matrLine, matrColumn) = 0;
                     end
                  end
               end
           end
       end
    end
end

