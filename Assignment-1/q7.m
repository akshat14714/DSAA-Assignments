function filter = q7(I,O)
    x = size(I,2);
    y = size(O,2);
    
    % Length of filter = length of Input - length of Output + 1
    len = x-y+1;
    
    resultant = zeros(len, len);
    
    for i=1:len
        resultant(i, :) = I(i:i+len-1);
        disp(resultant);
    end
    
    temp = O';
    
    filter = flipud(pinv(resultant)*temp(1:len))';
end