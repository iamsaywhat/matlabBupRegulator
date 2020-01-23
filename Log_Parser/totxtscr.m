%[filenamexls, pathxls] = uiputfile();
%fullFileName = strcat(app.path, app.filename);
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
% T = table(Timestamp, Model_Lat, Model_Lon,...
%     Model_Alt, Model_Course, MAP, Model_BIM_CMD,...
%     BIML_Pos, BIMR_Pos,Model_TDLat, Model_TDLon,...
%     Model_TDALt, Model_FinLat, Model_FinLon, ...
%     Model_FinALt, Fin_SWSHeight, Fin_MAP,'RowNames',TagList)


filename = 'afff.txt'

file = fopen(filename, 'w');     % открытие файла на запись
if file == -1                     % проверка корректности открытия
    error('File is not opened');
else
    fprintf(file, 'Touchdown Point:\n');
    fprintf(file, 'Latitude: %f\n', Model_TDLat);
    fprintf(file, 'Longitude: %f\n', Model_TDLon);
    fprintf(file, 'Altitude: %f\n', Model_TDALt);
    fprintf(file, '\n');
    fprintf(file, 'Final Point:\n');
    fprintf(file, 'Latitude: %f\n', Model_FinLat);
    fprintf(file, 'Longitude: %f\n', Model_FinLon);
    fprintf(file, 'Altitude: %f\n', Model_FinALt);
    fprintf(file, 'SWS Height: %f\n', Fin_SWSHeight);
    fprintf(file, 'MAP: %f\n', Fin_MAP);
    fprintf(file, '\n\n');
    
    T = table(Timestamp, Model_Lat, Model_Lon,...
    Model_Alt, Model_Course, MAP, Model_BIM_CMD,...
    BIML_Pos, BIMR_Pos, ...
    'VariableNames',{'Time_sec','Latitude_deg', ...
    'Longitude_deg', 'Altitude_m', 'Course_rad',...
    'Relief_m', 'CommandBIM_per', 'LeftBIM_per', 'RightBIM_per'});

    writetable(T,'afffff.xls');
end
fclose(file);