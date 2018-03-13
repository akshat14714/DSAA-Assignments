% Recoding own voice
%%% Originally sampled at 44.1kHz and digitized at 24 bits
myRecording = audiorecorder(44100, 24, 1);
disp('Start Recording! Record for 5 seconds');
recordblocking(myRecording, 5); % Record your sound for 5 seconds
disp('End of Recording');
%%% Recording done, Now saving the recording to a file
myrec = getaudiodata(myRecording);
audiowrite('myRec.wav', myrec, 44100);
figure;
plot(myrec);
% Part (ii): Resampling of audio data
%%% Reading the audio from myRec.wav
[y, Fs] = audioread('myRec.wav');
%%% Resampling the audio data

Fs1 = 44100;
Fs2 = 24000;
Fs3 = 16000;
Fs4 = 8000;
Fs5 = 4000;

% When using inbuilt-function resample
% y24k = resample(y, 24000, Fs);
% y16k = resample(y, 16000, Fs);
% y8k = resample(y, 8000, Fs);
% y4k = resample(y, 4000, Fs);

%%% Playing the original sound
disp('Playing Original Sound');
sound(y, Fs);
pause(size(y)/Fs);

tim = length(myrec) / Fs1;
resampled = zeros(tim * Fs2, 1);
indx = round(linspace(1, length(myrec), length(resampled)));
resampled = myrec(indx);

% Playing resampled sound
disp('Playing Sound resampled at 24kHz');
sound(resampled, Fs2);
pause(size(resampled)/Fs2);
figure;
plot(resampled);

% For other frequencies just replace Fs2 with Fs3 for 16k, Fs4 for 8k or
% Fs5 for 4k

% ti = length(myrec) / Fs1;
[h1,FH1] = audioread('church.wav');
% sound(h1, FH1);
% pause(size(h1)/FH1);
% resampl = zeros(ti * FH1, 1);
% ind = round(linspace(1, length(h1), length(resampl)));
% resampl = h1(ind);
con1st = convn(y,h1);

% Playing the simulated sound
disp('Playing simulated sound with filter of church');
sound(con1st,Fs);
pause(size(y)/Fs);

% For other files just change the name of the filter file from church.wav
% to any other
