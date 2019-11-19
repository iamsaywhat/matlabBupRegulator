function cell = RepairCellData(cellInput)
    %  опируем вход
    cell = cellInput;
    % »знаЄм размер €чейки
    cellSize = size(cell);
    % ÷икл по строкам €чейки
    for cellLine = 1 : 1 : cellSize(1)
       % ÷икл по столбцам €чейки
       for cellColumn = 1 : 1 : cellSize(2)
           % ѕровер€ем €чейку на пустоту
           if isempty(cell{cellLine,cellColumn})
               % ѕустую €чейку форматируем в ноль
               cell{cellLine,cellColumn} = 0;
           else
               % “ут возможны два варианта:
               % либо €чейка не пустой скал€р, тогда все в пор€дке
               % либо €чейка матрица, а еЄ тоже необходимо проверить
               
               % ѕолучим размер €чейки
               matrSize = size(cell{cellLine,cellColumn});
               % ÷икл по строкам матрицы внутри €чейки
               for matrLine = 1 : 1 : matrSize(1)
                  % ÷икл по столбцам матрицы внутри €чейки
                  for matrColumn =  1 : 1 : matrSize(2)
                     % ѕустой элемент €чейки форматируем в ноль
                     if isempty(cell{cellLine,cellColumn}(matrLine, matrColumn))
                         cell{cellLine,cellColumn}(matrLine, matrColumn) = 0;
                     % NAN элемент €чейки форматируем в ноль
                     elseif isnan(cell{cellLine,cellColumn}(matrLine, matrColumn))
                         cell{cellLine,cellColumn}(matrLine, matrColumn) = 0;
                     end
                  end
               end
           end
       end
    end
end

