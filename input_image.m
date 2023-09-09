lc;
clear all;

% read image in decimal form
image = imread('cameraman.tif');
image = imresize(image, 0.5);

% padding
image2 = uint8(zeros(130,130));
image2(2:129,2:129) = image;

% change the radix, dec to hex
image3 = string(dec2hex(image2));
image3 = reshape(image3,130,130);


% output file
fileID = fopen('input_image.txt','w');
fprintf( fileID,'MEMORY_INITIALIZATION_RADIX=16;\nMEMORY_INITIALIZATION_VECTOR=' );
for i=1:1:130
    fprintf(fileID,'%s',image3(i,1:130));
    fprintf(fileID,',\r\n');
end
fprintf( fileID,';' );

fclose(fileID);
