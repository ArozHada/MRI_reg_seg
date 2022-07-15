%Enter the path for the output points txt file 
registered_path = 'C:\Users\MSI\Desktop\Final Projects\MIRA_Final Project\elastix_win\output\default_nonrigid\copd1\transform\outputpoints.txt'

%reading moving features
fid             = fopen(registered_path);
content_cell    = textscan(fid, '%s', 'delimiter', '\n');
xm              = zeros(length(content_cell{1}),1);
ym              = zeros(length(content_cell{1}),1);
zm              = zeros(length(content_cell{1}),1);

%for all lines
for i=1:length(content_cell{1})
content= content_cell{1}{i};

%find Output index fixed
start_index=  strfind(content, 'OutputIndexFixed = [ ');
end_index = strfind(content, ' ]	; OutputPoint');

%Removing the brackets
numbers = content(start_index + 21 : end_index-1);
numbers_cell = split(numbers, ' ');

%changing datatype from string/char array to double
xm(i) = str2double(numbers_cell{1});
ym(i) = str2double(numbers_cell{2});
zm(i) = str2double(numbers_cell{3});
    
end

registered_indices = [xm, ym, zm];


%Saving the file as a txt
dlmwrite('C:\Users\MSI\Desktop\output_copd1.txt', registered_indices, 'delimiter','\t','newline','pc','precision',13);
