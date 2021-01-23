clc;
clear all;
close all;
A=imread('cameraman.tif');
figure(1)
imshow(A)
title('original image');
[a,b]=size(A);

scaling1=0.5;
for i=1:a*scaling1-1
    for j=1:b*scaling1-1
        A1(i,j)=A(round(i/scaling1),round(j/scaling1));
    end
end
figure(2)
imshow(A1)
title('scaling by 0.5 using nearest neighbour interpolation')
scaling2=2;
for i=1:a*scaling2-1
    for j=1:b*scaling2-1
        A2(i,j)=A(round(i/scaling2),round(j/scaling2));
    end
end
figure(3)
imshow(A2)
title('scaling by 2 using nearest neighbour interpolation')

a1=200;a2=200;
scaling3=201/256;
for i=1:a1
    for j=1:a2
        A3(i,j)=A(round(i/scaling3),round(j/scaling3));
    end
end
figure(4)
imshow(A3)
title('image of size 200*200 using nearest neighbour interpolation')







        
            
        
        
        