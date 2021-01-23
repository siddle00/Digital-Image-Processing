clc
close all;
clear all;

i_im =imread('pisa.jpg');
figure(1)
imshow(i_im)

W=size(i_im,1); 
o_im=uint8(zeros(W-1,W-1));
theta=3.91*pi/180;
for i=1:W-1
    for j=1:W-1

        x = (i-W/2)*cos(theta)+(j-W/2)*sin(theta)+W/2;
        y = -(i-W/2)*sin(theta)+(j-W/2)*cos(theta)+W/2;
        x1 = floor(x);
        y1 = floor(y);
        x2 = x1 + 1;
        y2 = y1 + 1;

        if ((x1 >= 1) && (y1 >= 1) && (x2 <= W) && (y2 <= W))
            %Load 2x2 pixels
             i11 = i_im(x1,y1); %Top left pixel
             i21 = i_im(x1,y2); %Bottom left pixel
             i12 = i_im(x2,y1); %Top right pixel
             i22 = i_im(x2, y2); %Bottom right pixel
             
            %Interpolation weights
            dx = x2 - x;
            dy = y2 - y;

            %Bi-linear interpolation
            o_im(i, j) = i11*dx*dy + i21*dx*(1-dy) + i12*(1-dx)*dy + i22*(1-dx)*(1-dy);
        end
    end
end

o_im=o_im(1:size(i_im,1)-1,1:size(i_im,2)-1)
figure(2)
imshow(o_im)
