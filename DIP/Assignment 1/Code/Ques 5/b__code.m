clc
clear all
close all
%histogram for reference image
a=imread('poutbright.jpg');
b=rgb2gray(a);
figure(1)
subplot(1,3,1)
imshow(b);title('reference image');
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
cdf1=round(cdf);

%histogram for question
%histogram for reference image
a=imread('poutdark.jpg');
b=rgb2gray(a);
b1=b;
figure(1)
subplot(1,3,2)
imshow(b);title('input image');
l=size(b,1);
w=size(b,2);
pixelstotal=size(b,1)*size(b,2);
h1=uint8(zeros(size(b)));
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
cdf2=round(cdf);

%comparing the histograms of 1 and 2
net=zeros(1,256);
for i=1:length(cdf1)
    dis=abs(cdf2(i)-cdf1);
    m=1;
    mi=dis(1);
    for j=1:length(dis)
        if(dis(j)<mi)
            mi=dis(j);
            m=m+1;
        end
    end
    net(i)=m-1;
end

for i=1:l
    for j=1:w
        pix=b(i,j);
        h(i,j)=net(pix+1);
    end
end
subplot(1,3,3)
imshow(h);title('output image');

