clear
clc

Timestamp = [];
Model_Lat = [];
Model_Lon = [];
Model_Alt = [];
Course = [];
MAP = [];
BIM_CMD = [];

BIML_Pos = [];
BIMR_Pos = []; 



TagList = {
 'Timestamp, sec: ';
 'Model_Lat, deg: ';
 'Model_Lon, deg: ';
 'Model_Alt, m: ';
 'Model_Course, rad: ';
 'MAP, m: ';
 'Model_BIM_CMD: ';
 'BIML_Pos: ';
 'BIML_Pos: ';
}




filename = 'saulog_0002.log';
file = fopen(filename, 'r');     % открытие файла на запись
if file == -1                     % проверка корректности открытия
    error('File is not opened');
else
 while ~feof(file)
    line = fgets(file);
    disp(line);
    
    temp_line = line;
    temp_line = findNdelete(temp_line, 'Timestamp, sec: ');
    if ~strcmp (temp_line, '')
        Timestamp = [Timestamp; str2double(temp_line)];
    end
    
    temp_line = line;
    temp_line = findNdelete(temp_line, 'Model_Lat, deg: ');
    if ~strcmp (temp_line, '')
        Model_Lat = [Model_Lat; str2double(temp_line)];
    end
    
    temp_line = line;
    temp_line = findNdelete(temp_line, 'Model_Lon, deg: ');
    if ~strcmp (temp_line, '')
        Model_Lon = [Model_Lon; str2double(temp_line)];
    end
    
    temp_line = line;
    temp_line = findNdelete(temp_line, 'Model_Alt, m: ');
    if ~strcmp (temp_line, '')
        Model_Alt = [Model_Alt; str2double(temp_line)];
    end
    
    temp_line = line;
    temp_line = findNdelete(temp_line, 'Model_Course, rad: ');
    if ~strcmp (temp_line, '')
        Course = [Course; str2double(temp_line)];
    end
    
    temp_line = line;
    temp_line = findNdelete(temp_line, 'MAP, m: ');
    if ~strcmp (temp_line, '')
        MAP = [MAP; str2double(temp_line)];
    end
    
    temp_line = line;
    temp_line = findNdelete(temp_line, 'Model_BIM_CMD: ');
    if ~strcmp (temp_line, '')
        BIM_CMD = [BIM_CMD; str2double(temp_line)];
    end
    
    temp_line = line;
    temp_line = findNdelete(temp_line, 'BIML_Pos: ');
    if ~strcmp (temp_line, '')
        BIML_Pos = [BIML_Pos; str2double(temp_line)];
    end
    
    temp_line = line;
    temp_line = findNdelete(temp_line, 'BIMR_Pos: ');
    if ~strcmp (temp_line, '')
        BIMR_Pos = [BIMR_Pos; str2double(temp_line)];
    end
    
    
    end
end

