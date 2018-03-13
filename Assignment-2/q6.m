function decrypted = q6(fileName)
    [audioMsg, ~] = audioread(fileName);
    x1 = fft(audioMsg);
    msgLen = length(x1);

    idx = [1 2 3 4];

    origSub1 = x1(4*(msgLen/8) + 1: 5*(msgLen/8));
    origSub2 = x1(5*(msgLen/8) + 1: 6*(msgLen/8));
    origSub3 = x1(6*(msgLen/8) + 1 : 7*(msgLen/8));
    origSub4 = x1(7*(msgLen/8) + 1: msgLen);
    
    % find all permutations and map it to the samples in sample_array
    idx = perms(idx);

    subArray = [origSub1 origSub2 origSub3 origSub4];
    
    i = 1;
    
    while i<=24

        % obtain whole of the row
        row = idx(i,:);
        
        reconst2 = vertcat(flipud(subArray(:,row(1))),flipud(subArray(:,row(2))),flipud(subArray(:,row(3))),flipud(subArray(:,row(4))));
        
        reconst1 = vertcat(subArray(:,row(1)),subArray(:,row(2)),subArray(:,row(3)),subArray(:,row(4)));

        finalRecons = vertcat(reconst2,reconst1);

        decrypted = ifft(finalRecons);
        
        audiowrite(strcat(strcat('decrypt', int2str(i)), '.wav'), decrypted,32000);
        
        i = i + 1;

    end
end