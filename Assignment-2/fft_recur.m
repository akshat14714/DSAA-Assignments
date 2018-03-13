% Taken reference from Recursive implementation pseudo code of Cooley Tukey
% Algorithm (Divide and Conquer Approach)

function y = fft_recur(img)
    
    img = double(img);
    n = length(img);
    theta = exp(-2 * pi * 1i / n);
    
    if mod(n, 2) == 1
        % Fourier Matrix
        p = 0:n-1;
        k = p';
        F = theta .^ (k*p);
        y = F*img;
        
    else
        % Recursive divide and conquer (Cooley tukey algorithm)
        k = (0:n/2-1)';
        v = (theta .^ k) .* (fft_recur(img(2:2:n)));
        u = fft_recur(img(1:2:n-1));
        y = [u+v; u-v];
        
    end
    
end