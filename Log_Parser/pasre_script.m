clear
clc
% ��� �����
filename = 'saulog_0002.log';
% ������ ������ ����� �� ������� ����� ������ ���������� � �����
% TagList = {
%  'Timestamp, sec: ';
%  'Model_Lat, deg: ';
%  'Model_Lon, deg: ';
%  'Model_Alt, m: ';
%  'Model_Course, rad: ';
%  'MAP, m: ';
%  'Model_BIM_CMD: ';
%  'BIML_Pos: ';
%  'BIMR_Pos: ';
% };
        TagList = {
            'Timestamp, sec: ';
            'Model_Lat, deg: ';
            'Model_Lon, deg: ';
            'Model_Alt, m: ';
            'Model_Course, rad: ';
            'MAP, m: ';
            'Model_BIM_CMD: ';
            'BIML_Pos: ';
            'BIMR_Pos: ';
            'TD_Lat: ';
            'TD_Lon: ';
            'TD_Alt: ';
            'Fin_Lat, deg: ';
            'Fin_Lon, deg: ';
            'Fin_Alt, m: ';
            'Fin_SWSHeight: ';
            'Fin_MAP, m: ';
        };

% ��������� ����
file = fopen(filename, 'r');     % �������� ����� �� ������
if file == -1                     % �������� ������������ ��������
    error('File is not opened');
else
    % ������ ����
    result = ParseFileByTags (file, TagList);
end
fclose(file);

Timestamp     = result{1};
Model_Lat     = result{2};
Model_Lon     = result{3};
Model_Alt     = result{4};
Model_Course  = result{5};
MAP           = result{6};
Model_BIM_CMD = result{7};
BIML_Pos      = result{8};
BIMR_Pos      = result{9};
Model_TDLat   = result{10};
Model_TDLon   = result{11};
Model_TDALt   = result{12};
Model_FinLat  = result{13};
Model_FinLon  = result{14};
Model_FinALt  = result{15};
Fin_SWSHeight = result{16};
Fin_MAP       = result{17};

%clear result;
%clear TagList;
clear filename;
clear file;
clear ans;

close all
plot3(Model_Lat, Model_Lon, Model_Alt), grid on;
figure
plot(Timestamp, Model_BIM_CMD, Timestamp, -BIML_Pos, Timestamp, BIMR_Pos), grid on
figure
plot(Timestamp, Model_Course), grid on







