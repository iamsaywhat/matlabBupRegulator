[filenamexls, pathxls] = uiputfile();
fullFileName = strcat(app.path, app.filename);
headers = {
    'Time';         % 1
    'Latitude';     % 2
    'Longitude';    % 3
    'Altitude';     % 4
    'Course';       % 5
    'Relief'        % 6
    'BIM CMD';      % 7
    'Left BIM';     % 8
    'Right BIM'     % 9 
    'TDP Lat';      % 10
    'TDP Lon';      % 11
    'TDP Alt';      % 12
    'Final Point Lat';  % 13
    'Final Point Lon';  % 14
    'Final Point Alt';  % 15
    };
xlswrite('My_file.xls',headers',     'Sheet1','A1');  % Заголовки

xlswrite('My_file.xls',Timestamp,    'Sheet1','A2'); % Время
xlswrite('My_file.xls',Model_Lat,    'Sheet1','B2'); % Широта
xlswrite('My_file.xls',Model_Lon,    'Sheet1','C2'); % Долгота
xlswrite('My_file.xls',Model_Alt,    'Sheet1','D2'); % Высота
xlswrite('My_file.xls',Model_Course, 'Sheet1','E2'); % Курс
xlswrite('My_file.xls',MAP,          'Sheet1','F2'); % Рельеф
xlswrite('My_file.xls',Model_BIM_CMD,'Sheet1','G2'); % Команды БИМ
xlswrite('My_file.xls',BIML_Pos,     'Sheet1','H2'); % Левый БИМ
xlswrite('My_file.xls',BIMR_Pos,     'Sheet1','I2'); % Правый БИМ

xlswrite('My_file.xls',Model_TDLat,  'Sheet1','J2'); % Точка приземления
xlswrite('My_file.xls',Model_TDLon,  'Sheet1','K2'); % Точка приземления
xlswrite('My_file.xls',Model_TDALt,  'Sheet1','L2'); % Точка приземления


xlswrite('My_file.xls',Model_FinLat, 'Sheet1','M2'); % Финальная точка
xlswrite('My_file.xls',Model_FinLon, 'Sheet1','N2'); % Финальная точка
xlswrite('My_file.xls',Model_FinALt, 'Sheet1','O2'); % Финальная точка
