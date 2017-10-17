%Inclass 13

%Part 1. In this directory, you will find an image of some cells expressing a 
% fluorescent protein in the nucleus. 
% A. Create a new image with intensity normalization so that all the cell
% nuclei appear approximately eqully bright. 
img1=imread('Dish1Well8Hyb1Before_w0001_m0006.tif');
img2=im2double(img1);
img2d=imdilate(img2,strel('disk',15));
imgnorm=img2./img2d;
imshow(imgnorm,[])

% B. Threshold this normalized image to produce a binary mask where the nuclei are marked true.
imgt=imgnorm>0.5;
imshow(imgt)
% C. Run an edge detection algorithm and make a binary mask where the edges
% are marked true.

edgeimg=edge(img1,'canny');
imshow(edgeimg,[0.01 0.05])
% D. Display a three color image where the orignal image is red, the
% nuclear mask is green, and the edge mask is blue.

toshow=cat(3,im2double(imadjust(img1)),imgt,edgeimg);
imshow(toshow)


%Part 2. Continue with your nuclear mask from part 1. 
%A. Use regionprops to find the centers of the objects

cen=regionprops(imgt,'centroid');
centroids=cat(1,cen.Centroid)
%B. display the mask and plot the centers of the objects on top of the
%objects
imshow(imgt)
hold on;
plot(centroids(:,1),centroids(:,2),'b*')
hold off;
%C. Make a new figure without the image and plot the centers of the objects
%so they appear in the same positions as when you plot on the image (Hint: remember
%Image coordinates). 
figure;
x=centroids(:,1)
y=centroids(:,2)*(-1);
plot(x,-y,'r*')

