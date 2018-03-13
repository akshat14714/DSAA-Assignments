function [outImg] = RESIZENN(inpImg, dim)
    % The resolution scale factors: [rows columns]
    scale = [dim dim];
    
    % Get the size of the input image
    oldSize = size(inpImg);
    
    % Compute the size of the output image
    newSize = max(floor(scale.*oldSize(1:2)),1);
    
    % Compute an unsampled set of indices
    rowIndex = min(round(((1:newSize(1))-0.5)./scale(1)+0.5), oldSize(1));
    colIndex = min(round(((1:newSize(2))-0.5)./scale(2)+0.5), oldSize(2));
    
    % Index input image to get output image
    outImg = inpImg(rowIndex, colIndex,:);
end