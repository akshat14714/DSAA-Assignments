function spectro = q3(audioFile, windowLen, strideLen)
    i = 1;
    startInd = 1;
    len = length(audioFile);
    hammingWin = hamming(windowLen);
    totalRows = ceil(len/(windowLen-strideLen));
    finalMat = [totalRows,windowLen];
    myFlag = 0;
    while myFlag ~= 1
        endindex = startInd + windowLen - 1;
        if endindex > len
            endindex = len;
            myFlag = 1;
            hammingWin = hamming(endindex - startInd + 1);
        end
        a = audioFile(startInd:endindex) .* hammingWin;
        a = fft(a);
        a = abs(a);
        finalMat(i,1:min(windowLen, endindex - startInd + 1)) = a;
        i = i + 1;
        startInd = startInd + windowLen - strideLen;
    end
    figure, imagesc(flipud(log(finalMat(:, 1:windowLen/2))));
    colorbar;
    spectro = finalMat;
end