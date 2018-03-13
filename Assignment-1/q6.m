%% Without any inbuilt function
disp('Without using any inbuilt function');
% Read the images
F1 = imread('F1.jpg');
Faces = imread('Faces.jpg');

% Get the sizes of the images
[ax, ay, ac] = size(F1);
[bx, by, bc] = size(Faces);

% Detect the image contained in F1 in image contained in Faces by tranversing
% the image and checking whether all the values in image size of Faces
% equals to F1 or not
mx = 0;
ii = 1;
ij = 1;
for i=1:bx-ax
    for j=1:by-ay
        sm = sum(Faces(i:i+ax-1, j:j+ay-1, :) == F1);
        if sm > mx
            mx = sm;
            ii = i;
            ij = j;
        end
    end
end

% Highlighting the image F1 in Faces
Faces(ii:ii+ax-1, ij:ij+2, :) = 0;
Faces(ii:ii+ax-1, ij+ay-3:ij+ay-1, :) = 0;
Faces(ii:ii+2, ij:ij+ay-1, :) = 0;
Faces(ii+ax-3:ii+ax-1, ij:ij+ay-1, :) = 0;

% Finally show the image Faces with highlighted F1
figure;
imshow(Faces);
title('Without any inbuilt function');

%% Using normxcorr2
disp('Using built-in function normxcorr2');
% Read the images and convert to gray scale
F1 = rgb2gray(imread('Assignment1/F1.jpg'));
Faces = rgb2gray(imread('Assignment1/Faces.jpg'));
 
% Perform cross-correlation on the images
c = normxcorr2(F1, Faces);
 
% Finding peak in cross-correlation
[ypeak, xpeak] = find(c==max(c(:)));
 
% Accounting for padding that normxcorr2 adds
yoffSet = ypeak-size(F1,1);
xoffSet = xpeak-size(F1,2);
 
% Displaying the matched area
figure
imshow(Faces);
imrect(gca, [xoffSet+1, yoffSet+1, size(F1,2), size(F1,1)]);
title('Using built-in function normxcorr2');
