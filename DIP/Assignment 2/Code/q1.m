clear all;
close all;
clc;
a = imread('lenagray.jpg');
A = fft2(a);
N = length(a);
A1 = [];


subplot(1,3,1);
imshow(a);
title('input: lena image');

for i = 1:N
    A1 = [A1 ; fft(a(i,:))];
end
A2 = [];
for i = 1:N
    A2 = [A2  fft(A1(:,i))];
end
a1 = ifft2(A);
a2 = ifft2(A2);
subplot(1,3,2);
imshow(uint8(a1));
title('IFT(2D DFT)');
subplot(1,3,3);
imshow(uint8(abs(a2)));
title('IFT(1D DFTx(1D DFTy))');