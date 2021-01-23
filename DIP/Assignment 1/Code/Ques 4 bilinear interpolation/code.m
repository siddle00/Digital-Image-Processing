clc
close all;
clear all;

input_image =imread('cameraman.tif');

W=size(input_image,1);  % height
output_image1=uint8(zeros((W/2)-1,(W/2)-1));
for i=1:((W/2)-1)
    for j=1:((W/2)-1)

        x = i*2;
        y = j*2;
        x1 = floor(x);
        y1 = floor(y);
        x2 = x1 + 1;
        y2 = y1 + 1;

        %Bi-linear interpolation ilustration:
        %Image coordinates style (horizontal index first)
        %
        %(x1,y1)    |           (x2,y1)
        %           | 1-dy
        %    1-dx   |       dx
        %   ------(a,b)------------
        %           |
        %           |
        %           |
        %           | dy
        %           |
        %           |
        %(x1,y2)    |           (x2,y2)

        if ((x1 >= 1) && (y1 >= 1) && (x2 <= W) && (y2 <= W))
            %Load 2x2 pixels
             i11 = input_image(x1,y1); %Top left pixel
             i21 = input_image(x1,y2); %Bottom left pixel
             i12 = input_image(x2,y1); %Top right pixel
             i22 = input_image(x2, y2); %Bottom right pixel
             
            %Interpolation weights
            dx = x2 - x;
            dy = y2 - y;

            %Bi-linear interpolation
            output_image1(i, j) = i11*dx*dy + i21*dx*(1-dy) + i12*(1-dx)*dy + i22*(1-dx)*(1-dy);
        end
    end
end
output_image2=uint8(zeros((2*W)-1,(2*W)-1));
for i=1:((2*W)-1)
    for j=1:((2*W)-1)

        x = i/2;
        y = j/2;
        x1 = floor(x);
        y1 = floor(y);
        x2 = x1 + 1;
        y2 = y1 + 1;

        if ((x1 >= 1) && (y1 >= 1) && (x2 <= W) && (y2 <= W))
            %Load 2x2 pixels
             i11 = input_image(x1,y1); %Top left pixel
             i21 = input_image(x1,y2); %Bottom left pixel
             i12 = input_image(x2,y1); %Top right pixel
             i22 = input_image(x2, y2); %Bottom right pixel
             
            %Interpolation weights
            dx = x2 - x;
            dy = y2 - y;

            %Bi-linear interpolation
            output_image2(i, j) = i11*dx*dy + i21*dx*(1-dy) + i12*(1-dx)*dy + i22*(1-dx)*(1-dy);
        end
           end
end
p=1;
for v=1:W-1
     output_image2(1,p:p+1)=[input_image(1,v) input_image(1,v)];
      output_image2(p:p+1,1)=[input_image(v,1) input_image(v,1)]';
      p=p+2;
end
output_image2(511,1)=input_image(256,1);
output_image2(1,511)=input_image(1,256);
output_image3=uint8(zeros(200,200));
for i=1:200
    for j=1:200

        x = i*256/201;
        y = j*256/201;
        x1 = floor(x);
        y1 = floor(y);
        x2 = x1 + 1;
        y2 = y1 + 1;

        if ((x1 >= 1) && (y1 >= 1) && (x2 <= W) && (y2 <= W))
            %Load 2x2 pixels
             i11 = input_image(x1,y1); %Top left pixel
             i21 = input_image(x1,y2); %Bottom left pixel
             i12 = input_image(x2,y1); %Top right pixel
             i22 = input_image(x2, y2); %Bottom right pixel
             
            %Interpolation weights
            dx = x2 - x;
            dy = y2 - y;

            %Bi-linear interpolation
            output_image3(i, j) = i11*dx*dy + i21*dx*(1-dy) + i12*(1-dx)*dy + i22*(1-dx)*(1-dy);
        end
    end
end
figure
imshow(input_image);
title('Original Image')
figure
imshow(output_image1);
title('Scaled by 0.5 using bilinear interpolation')
figure
imshow(output_image2);
title('Scaled by 2 using bilinear interpolation')
figure
imshow(output_image3);
title('Image of size 200x200 using bilinear interpolation')