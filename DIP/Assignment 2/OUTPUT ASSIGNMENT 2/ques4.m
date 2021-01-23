clear all;
close all;
clc;
A = imread('Lenna.png');
subplot(1,2,1);
imshow(A);
title('input: lena image');

A(:,:,1) = histeq(A(:,:,1));
A(:,:,2) = histeq(A(:,:,2));
A(:,:,3) = histeq(A(:,:,3));
subplot(1,2,2);
imshow(A);
title('output: histogram equalised image');