function [result] = DenoiseSignal(fileName)
    noise_img = imread(fileName);
    [rows, cols, channels] = size(noise_img);

    noise_red = fft2(noise_img(:, :, 1));
    fft_red_noise = fftshift(noise_red);
    
    noise_blue = fft2(noise_img(:, :, 3));
    fft_blue_noise = fftshift(noise_blue);
    
    noise_green = fft2(noise_img(:, :, 2));
    fft_green_noise = fftshift(noise_green);

    filter = ones(rows, cols);
    length = 120;
    width = 0.4;
    
    % Along the breadth filtering
    filter(1:length, (ceil(29*cols/30 + 3) - width):(ceil(29*cols/30 + 3) + width)) = 0.0;
    filter(rows-length:rows, (ceil(29*cols/30 + 3) - width):(ceil(29*cols/30 + 3) + width)) = 0.0;
    filter(1:length, (ceil(cols/30 - 2) - width):(ceil(cols/30 - 2) + width)) = 0.0;
    filter(rows-length:rows, (ceil(cols/30 - 2) - width):(ceil(cols/30 - 2) + width)) = 0.0;
    filter(1:length, (ceil(cols/2 + 1) - width):(ceil(cols/2 + 1) + width)) = 0.0;
    filter(rows-length:rows, (ceil(cols/2 + 1) - width):(ceil(cols/2 + 1) + width)) = 0.0;
    filter(1:length, (ceil(cols/3 - 8) - width):(ceil(cols/3 - 8) + width)) = 0.0;
    filter(rows-length:rows, (ceil(cols/3 - 8) - width):(ceil(cols/3 - 8) + width)) = 0.0;
    filter(1:length, (ceil(2*cols/3 + 9) - width):(ceil(2*cols/3 + 9) + width)) = 0.0;
    filter(rows-length:rows, (ceil(2*cols/3 + 9) - width):(ceil(2*cols/3 + 9) + width)) = 0.0;
    
    % Along the length filtering
    filter((ceil(3*rows/4 + 4) - width):(ceil(3*rows/4 + 4) + width), 1:length) = 0.0;
    filter((ceil(rows/4 - 2) - width):(ceil(rows/4 - 2) + width), 1:length) = 0.0;
    filter((ceil(3*rows/4 + 4) - width):(ceil(3*rows/4 + 4) + width), cols-length:cols) = 0.0;
    filter((ceil(rows/4 - 2) - width):(ceil(rows/4 - 2) + width), cols-length:cols) = 0.0;
    filter((ceil(rows/2 + 1) - width):(ceil(rows/2 + 1) + width), cols-length:cols) = 0.0;
    filter((ceil(rows/2 + 1) - width):(ceil(rows/2 + 1) + width), 1:length) = 0.0;

    %figure;imshow(filter);

    red_filtered = abs(ifft2(ifftshift(fft_red_noise .* filter)));
    green_filtered = abs(ifft2(ifftshift(fft_green_noise .* filter)));
    blue_filtered = abs(ifft2(ifftshift(fft_blue_noise .* filter)));
    
    result = cat(3, uint8(red_filtered), uint8(green_filtered), uint8(blue_filtered));

    % brighten up image
    gamma = 0.5;
    J = imadjust(result,[],[],gamma);
    J = imsharpen(J);m
    figure;imshow(J, []);
end