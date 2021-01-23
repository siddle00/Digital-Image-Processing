clc
clear all
close all
a=imread('poutdark.jpg');
b=rgb2gray(a);
b1=b;
figure(1)
subplot(1,2,1)
imshow(b);
title('input image');
l=size(b,1);
w=size(b,2);
pixelstotal=size(b,1)*size(b,2);
h=uint8(zeros(size(b)));
%calculating frequency of every pixel value. totally there are 256 pixels.
f=zeros(1,256);
for i=1:l
    for j=1:w
        pix=b(i,j);
        f(pix+1)=f(pix+1)+1;
    end
end
%calculating probability of every pixel value
p=f/pixelstotal;
%find cumulatve frequency
cdf=zeros(1,256);
for i=1:length(f)
    cdf(i)=sum(p(1:i));
end
%on doing histogram equalisation
cdf=cdf*255;
cdf=round(cdf);

for i=1:l
    for j=1:w
        pix=b(i,j);
        h(i,j)=cdf(pix+1);
    end
end
subplot(1,2,2)
imshow(h)
title('histogram eq. image');
