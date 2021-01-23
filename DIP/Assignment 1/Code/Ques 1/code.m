clc
clear all
close all
y = imread('lena.jpg');
imshow(y);
m = 0;
var_gauss = 0.1;
for i = 1:100
    J(:,:,i) = imnoise(y,'gaussian',m,var_gauss);
end
figure;
subplot(2,2,1)
imshow(J(:,:,1));
title(' Noisy version sample 1 ');
subplot(2,2,2)
imshow(J(:,:,2));
title(' Noisy version sample 2 ');
subplot(2,2,3)
imshow(J(:,:,3));
title(' Noisy version sample 3 ');
subplot(2,2,4)
imshow(J(:,:,4));
title(' Noisy version sample 4 ');
X = double(J);
S = zeros(512,512);
for i = 1:100
    S(:,:) = S(:,:) + X(:,:,i);
end
S = S/100;
figure;
imshow(uint8(S));
title('Average of noisy images');