% Read the image sample_inp.png and image sample_out.png
Inp = imread('sample_inp.png');
Out = imread('sample_out.png');

% Convoluting filter matrix after searching through web and applying brute force
M = [0 0 0; 1 1 1; -1 -1 -1];

% Appling convolution on input image using the above filter
I = convn(Inp, M);

% Comparing the images
figure;
subplot(2,2,1);
imshow(I);
title('My Output');
subplot(2,2,2);
imshow(Inp);
title('Sample Input');
subplot(2,2,3);
imshow(Out);
title('Sample Output');

% Convolving with blur.jpg
% Blur = imread('Assignment1/blur.jpg');
Blur = imread('blur.jpg');
BlurC = convn(Blur, M); % Convolving with M
BlurCT = convn(Blur, M'); % Convolving with M'

% Adding the above convolved blur images
BlurAdd = imadd(BlurC, BlurCT);
figure;
subplot(2,2,1);
imshow(BlurC);
title('Convolution with original');
subplot(2,2,2);
imshow(BlurCT);
title('Convolution with transpose');
subplot(2,2,3);
imshow(Blur);
title('Original blur.png');
subplot(2,2,4);
imshow(BlurAdd);
title('Final addition image');

% For other images just copy-paste the above code and change the name from
% blur.jpg to the file you want to use the filter on