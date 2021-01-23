clc
clear all
close all
I = imread('lena.jpg');
imshow(I);
title('Input lena image');
figure;
J = imnoise(I,'salt & pepper',.2);
subplot(2,2,1);
imshow(J);
title('Salt and pepper noise');
N = length(J);
%W = zeros(Wn,Wn);
for Wn = 3:2:7   % window size
    for i = 1:N
        for j = 1:N
            l1 = i - floor(Wn/2);
            l2 = j - floor(Wn/2);
            u1 = i + floor(Wn/2);
            u2 = j + floor(Wn/2);
            if (l1 < 1)
                if(l2 < 1)
                    W = J(1:u1,1:u2); 
                elseif  (u2 > N)
                    W = J(1:u1,l2:N);
                end
            elseif (u1 > N)
                if(l2 < 1)
                    W = J(l1:N,1:u2); 
                elseif  (u2 > N)
                    W = J(l1:N,l2:N);
                end
            elseif (l2 < 1)
                    W = J(l1:u1,1:u2);
            elseif (u2 > N)
                    W = J(l1:u1,l2:N);
            else    W = J(l1:u1,l2:u2);
            end    
            E = median(W,'all');
            J1(i,j) = E; 
        end
    end
    subplot(2,2,(Wn + 1)/2);
    imshow(J1);
    str=sprintf('%d * %d median filter',Wn,Wn);
    title(str);
    
end




            