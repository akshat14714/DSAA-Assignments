function [outImg] = RESIZEBL(inpImg, dim)
    % Getting some initial variables
    inpRows = size(inpImg, 1);
    inpCols = size(inpImg, 2);
    
    % The resolution scale factors: [rows columns]
    scale = [dim*inpRows dim*inpCols];
    outRows = scale(1);
    outCols = scale(2);
    
    % Let S_R = R / R' (Row Scaling)
    S_R = inpRows / outRows;
    % Let S_C = C / C' (Column Scaling)
    S_C = inpCols / outCols;
    
    % Define grid of co-ordinates in our image
    % Generate (x,y) pairs for each point in our image
    [cf, rf] = meshgrid(1 : outCols, 1 : outRows);
    
    % Let r_f = r'*S_R for r = 1,...,R'
    % Let c_f = c'*S_C for c = 1,...,C'
    rf = rf * S_R;
    cf = cf * S_C;
    
    % Let r = floor(rf) and c = floor(cf)
    r = floor(rf);
    c = floor(cf);
    
    % Any values out of range, cap
    r(r < 1) = 1;
    c(c < 1) = 1;
    r(r > inpRows-1) = inpRows - 1;
    c(c > inpCols-1) = inpCols - 1;
    
    % Let delta_R = rf - r and delta_C = cf - c
    delta_R = rf - r;
    delta_C = cf - c;
    
    % Get column major indices for each point we wish to access
    in1_ind = sub2ind([inpRows, inpCols], r, c);
    in2_ind = sub2ind([inpRows, inpCols], r+1, c);
    in3_ind = sub2ind([inpRows, inpCols], r, c+1);
    in4_ind = sub2ind([inpRows, inpCols], r+1, c+1);
    
    % Now interpolate
    % Go through each channel for the case of color
    % Create output image that is the same class as input
    outImg = zeros(outRows, outCols, size(inpImg, 3));
    outImg = cast(outImg, class(inpImg));
    
    % Create index vector to iterate the channels
    for index = 1 : size(inpImg, 3)
    
        chan = double(inpImg(:,:,index)); % Get i'th channel

        % Interpolate the channel
        tmp = chan(in1_ind).*(1 - delta_R).*(1 - delta_C) + chan(in2_ind).*(delta_R).*(1 - delta_C) + chan(in3_ind).*(1 - delta_R).*(delta_C) + chan(in4_ind).*(delta_R).*(delta_C);
        outImg(:,:,index) = cast(tmp, class(inpImg));
    end
end