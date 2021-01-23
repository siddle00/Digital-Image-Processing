z=imread('greek.jpg');
x=uint8(zeros(2160,2160));
z=rgb2gray(z);

subplot(2,4,1);
imshow(z);
title('input image');


for i=1:2160
    for j=1:2160
        if(z(i,j)<120)
            x(i,j)=0;
        else
            x(i,j)=255;
        end
    end
end
subplot(2,4,2);
imshow(x);
title('thresholded input');

se=strel('square',8);
erodedx=imerode(x,se);
subplot(2,4,3);
imshow(erodedx);
title('Erosion of x');


subplot(2,4,4);
imshow(imdilate(x,se));
title('Dialation of x');

subplot(2,4,5);
imshow(imopen(x,se));
title('Opening');


subplot(2,4,6);
imshow(imclose(x,se));
title('Closing');


subplot(2,4,7);
imshow(bwmorph(x,'thicken'));
title('Thickening');


subplot(2,4,8);
imshow(bwmorph(x,'thin'));
title('Thinning');

