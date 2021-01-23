clear all;
close all;
clc;
N = 200;
A = ones(100,100);
A1 = zeros(50,100);
A = [A1 ; A ; A1];
A2 = zeros(200,50);
A = [A2 A A2];
A = 100*A;

subplot(1,2,1);
imshow(uint8(A));
title('Created matrix input image');

S1= sum(A,1);
S2= sum(A,2);
AF = fliplr(A);
for k = -N+1:N-1
    DS(k+N) = sum(diag(A,k));
end
for k = -N+1:N-1
    DSF(k+N) = sum(diag(AF,k));
end
G = zeros(N,N);
for i = 1:N
    G(i,:) = G(i,:) + S1;
end
for i = 1:N
    G(:,i) = G(:,i) + S2;
end
G = fliplr(G);
for i = 1:N
    for j = 1:N
        G(i,j) = G(i,j) + DS(i+j-1);
    end
end
G = fliplr(G);
for i = 1:N
    for j = 1:N
        G(i,j) = G(i,j) + DSF(i+j-1);
    end
end
m = max(G,[],'all')
G = round((G/m)*255);

subplot(1,2,2);
imshow(uint8(G));
title('Back Projected approximation of input image');