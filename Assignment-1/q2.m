% Read the image cameraman.tif in variable I
I = imread('cameraman.tif');
I = im2double(I);

% Read the filter in variable M
M = [-1 -2 -1;0 0 0;1 2 1];

% Applying convolution on I with filter M and storing the output in variable C1
C1 = conv2(I, M);
figure;
subplot(1,2,1);
imshow(I);
title('Original');
subplot(1,2,2);
imshow(C1);
title('Convoluted with M');

% Applying convolution on I with filter M' and storing the output in variable C2
N = M';
C2 = conv2(I, N);
figure;
subplot(1,2,1);
imshow(I);
title('Original');
subplot(1,2,2);
imshow(C2);
title("Convoluted with M'");

% Comparision of both the convoluted images
figure;
subplot(1,2,1);
imshow(C1);
title('Convolution with M');
subplot(1,2,2);
imshow(C2);
title("Convoluted with M'");