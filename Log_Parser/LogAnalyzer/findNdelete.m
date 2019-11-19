%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   findNdelete - Поиск и удаление в строке sourse содержимое из find,
%   удаляет его, и удаляет \n
%   В общем парсит строку вида:
%   "[Тег-текст][Полезная информация]\n"
%       Тег-текст - Некоторый текст, по которому можем найти в строке (файле)
%   следующее за ним содержимое
%       Полезная информация - Текст который необходимо извлечь;
%   \n - Перенос строки, типовое завершение строки;
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
  
  % Берем длину строки
  findsize = findsize(2);
  
  % Проверяем вхождение find в первые findsize символов source
  if strncmp(find, source, findsize)
      % Вырезаем find из source
      result = strrep(source, find, '');
      % Вырезаем \n из source
      result = strrep(result, '\n', '');
  else
      % Вхождения отсутсвуют, возвращаем "пусто"
      result = '';
  end
end