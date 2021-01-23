clear all;
close all;
clc;
a = imread('lenagray.jpg');
b = rgb2gray(imread('cute pie.jpg'));

subplot(2,2,1);
imshow(a);
title('input: lena image');

subplot(2,2,2);
imshow(b);
title('input : dog image');


A = fft2(a);
B = fft2(b);
RA = abs(A);
RB = abs(B);
IA = angle(A);
IB = angle(B);
G1 = RB.*exp(i*IA);
G2 = RA.*exp(i*IB);
subplot(2,2,3);
imshow(uint8(abs(ifft2(G1))));
title('R(dog) + I(lena)');
subplot(2,2,4);
imshow(uint8(abs(ifft2(G2))));
title('R(lena) + I(dog)');