function [ dialed ] = Eavesdrop( audiofile )
    dialed = uint64(0);
    
    digit0 = audioread('q5/0.ogg');
    digit1 = audioread('q5/1.ogg');
    digit2 = audioread('q5/2.ogg');
    digit3 = audioread('q5/3.ogg');
    digit4 = audioread('q5/4.ogg');
    digit5 = audioread('q5/5.ogg');
    digit6 = audioread('q5/6.ogg');
    digit7 = audioread('q5/7.ogg');
    digit8 = audioread('q5/8.ogg');
    digit9 = audioread('q5/9.ogg');

    digits = [fft(digit0), fft(digit1), fft(digit2), fft(digit3), fft(digit4), fft(digit5), fft(digit6), fft(digit7), fft(digit8), fft(digit9)];

    len = size(digits, 2);
    
    audinfo = audioinfo(audiofile);
    windowLen = audinfo.TotalSamples/audinfo.SampleRate;
    
    for i=0:windowLen-1
        [window, ~] = audioread(audiofile, [i*audinfo.SampleRate + 1, (i+1)*audinfo.SampleRate]);
        max = 0;
        pos = -1;
        
        for j=1:len
            ff = fft(window);
            temp = dot(ff, digits(:, j));
            if temp > max
                max = temp;
                pos = j;
            end
%             fprintf('Yo\n');
        end
        
        fprintf('%d\n', dialed);
        fprintf('%d\n', pos-1);
        dialed = dialed*10 + (pos - 1);
    end
end