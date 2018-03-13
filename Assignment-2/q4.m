I1a = imread('q4/Img1a.png');
I1b = imread('q4/Img1b.png');
I2a = imread('q4/Img2a.png');
I2b = imread('q4/Img2b.png');

% Img1a
F = fft2(I1a);
fl = log(1 + abs(F));
fm = max(fl(:));
figure;
imshow(im2uint8(fl / fm));
title('Img1a');

% Img1b
F = fft2(I1b);
fl = log(1 + abs(F));
fm = max(fl(:));
figure;
imshow(im2uint8(fl / fm));
title('Img1b');

% Img2a
F = fft2(I2a);
fl = log(1 + abs(F));
fm = max(fl(:));
figure;
imshow(im2uint8(fl / fm));
title('Img2a');

% Img2b
F = fft2(I2b);
fl = log(1 + abs(F));
fm = max(fl(:));
figure;
imshow(im2uint8(fl / fm));
title('Img2b');