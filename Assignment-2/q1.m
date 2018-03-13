function result = q1(img)
    
    img = double(img);
    siz = size(img);
    y = zeros(siz);
    y1 = y;
    
    for i=1:siz(2)
        y(:, i) = fft_recur(img(:, i));
    end
    
    for i=1:siz(1)
        y1(i, :) = fft_recur(y(i, :).');
    end
    
    result = y1;
    
end