%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   ParseFileByTags - Парсер файлов. Выделяет и сортирует числовые 
%   значения из файла "file", по списку тегов list.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function parse_result = ParseFileByTags (file, list)
    
    % Проверим список тегов на корректность
    listsize = size(list);
    if listsize(2) ~= 1
        error('Second argument is incorrect')
    end
    % Узнаем количество тегов
    tag_num = size(list);
    tag_num = tag_num(1);
    % Создаём ячейки массивов
    for i = 1 : 1 : tag_num
        parse_result{i} = [];
    end
    % Начинаем разбирать строку за строкой, пока не настигнем конца файла
    while ~feof(file)
        % Берем строку из файла
        line = fgets(file);
        % Анализируем строку, сопоставляя с каждым тегом
        for i = 1:1:tag_num
            % Копируем строку оригинал
            temp_line = line;
            % Тут получаем либо пустую строку (не найдено соответствий)
            % Либо строковое число
            temp_line = findNdelete(temp_line, list{i});
            % Нужно как раз это проверить
            if ~strcmp (temp_line, '')
                % Если не пустая строка, то дополняем массив оригинал 
                % конвертированным значением
                res = str2double(temp_line);
                if isnan(res)
                    res = 0;
                end
                parse_result{i} = [parse_result{i}; res];
            end
        end
    end
end