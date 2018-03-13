x = input('Enter path of image: ');
Inp = imread(x);
y = input('Enter resize amount: ');
Out = RESIZENN(Inp,y); 
figure; imshow(Out, []); title('Nearest Neighbour');
figure; imshowpair(Inp,Out,'montage'); title('Input image vs Nearest Neighbour');

