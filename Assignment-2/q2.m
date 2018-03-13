load q2/q2.mat;

originalSig = X; % The original sound
originalFreq = Fs; % Sampling frequency of the original sound

% Original signal can be written to a file
audiowrite('initial2.wav',X,Fs);

originalLen = length(originalSig);

% Applying normal average in the original signal to mormalize the high
% intensity noise if present, and make the signal even
originalSig(:, 1) = conv(originalSig(:, 1), ones(3, 1)/3, 'same');

% Creating Hamming window of size 40
hammingWindow = hamming(40);

hamTotal = sum(hammingWindow);

% Apply Convolution using Hamming Filter
y = conv(originalSig(:, 1), hammingWindow/hamTotal, 'same');

% Apply signal smoothing using Savitzky-Golay smoothing filter
result = sgolayfilt(y, 1, 39);

% Plotting the frequencies of the signals
ff2 = fft(result);
plotr1 = abs(ff2/originalLen);
plotr2 = plotr1(1:originalLen/2+1);
plotr2(2:end-1) = 2*plotr2(2:end-1);
f2 = Fs*(0:(originalLen/2))/originalLen;
figure;
plot(f2,plotr2);
xlabel('f2 (Hz)');
ylabel('|P11(f)|');

ff=fft(X);
ploto1 =abs(ff/originalLen);
ploto2 = ploto1(1:originalLen/2+1);
ploto2(2:end-1) = 2*ploto2(2:end-1);
f = Fs*(0:(originalLen/2))/originalLen;
figure;
plot(f,ploto2); 
xlabel('f (Hz)');
ylabel('|P1(f)|');

% plot the resultant and original signal
figure;
plot(originalSig);
title('original');

figure; 
plot(result); 
title('resultant signal');

% Resultant signal can be written to the new file
audiowrite('q2result.wav', result, originalFreq);
