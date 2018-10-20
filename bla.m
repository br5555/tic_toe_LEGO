% %%
% img = imread('ploca.png')
%   
% %% initial stuff
% 
% clear all
% close all
% clc
% 
% %% image grabbing 
% 
% imaqreset
% vidObj = videoinput('winvideo', 1, 'YUY2_640x480'); 
% % if camera supports it, you can use RGB24_640x480 directly
% % to check camera properties use imaqhwinfo('winvideo') and check
% % SupportedFormats in DeviceInfo field of the returned variable
% vidObj.ReturnedColorSpace = 'rgb';
% start(vidObj);
% img = getdata(vidObj);
% img = img(:,:,(1:3));
% imshow(img);title('Input image');
% stop(vidObj);
% 
% %% color spaces
% 
% img_gray = rgb2gray(img);
% img_hsv = rgb2hsv(img);
% figure();imshow(img_gray);title('Grayscale image');
% figure();imshow(img_hsv);title('Image in HSV colorspace');
% 
% %% filters
% 
% % gaussian
% gauss_filt = fspecial('gaussian', [3,3], 1);
% img_gaussfilt = imfilter(img, gauss_filt);
% figure();imshow(img_gaussfilt);title('Gaussian filter');
% 
% % median
% % img_medfilt = medfilt2(img_gray);
% % figure();imshow(img_medfilt);title('Median filter');
% 
% %% segmentation
% 
% % simple thresholding
% img_threshold = im2bw(img_gray, 0.6);
% 
% % otsu thresholding
% level = graythresh(img_gray);
% img_otsu = im2bw(img_gray, level);
% figure();imshow(img_threshold);title('Thresholded image');
% figure();imshow(img_otsu);title('Otsu thresholding');
% 
% 
% %% morphological operations
% 
% % simple erode and dilate
% struct_element = strel('square', 5);
% img_erode = imerode(img_otsu, struct_element);
% img_dilate = imdilate(img_otsu, struct_element);
% 
% % morphological opening and closing
% img_open = imopen(img_otsu, struct_element);
% img_close = imclose(img_otsu, struct_element);
% 
% figure();imshow(img_erode);title('Eroded image');
% figure();imshow(img_dilate);title('Dilated image');
% figure();imshow(img_open);title('Opened image');
% figure();imshow(img_close);title('Closed image');
% 
% %% edge detectors
% 
% img_edge_sobel = edge(img_gray, 'sobel');
% img_edge_canny = edge(img_gray, 'canny');
% figure();imshow(img_edge_sobel);title('Sobel edge detector');
% figure();imshow(img_edge_canny);title('Canny edge detector');
% 
% %% lines 
% 
% [H,T,R] = hough(img_rub);
% P = houghpeaks(H,100,'threshold', ceil(0.3*max(H(:))));
% lines = houghlines(img_rub, T, R, P, 'FillGap', 5, 'MinLength', 10);
% figure, imshow(img_rub), 
% hold on, title('Lines');
% max_len = 0;
% for k = 1:length(lines)
%     xy = [lines(k).point1; lines(k).point2];
%     plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
%     
% %     plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
% %     plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
% end
% %% resize
% figure
% imshow(img)
% img_s = imresize (img, 0.4)
% figure
% imshow(img_s)
% %%
% img_filt = imcrop(filt, [5 5 200-5 177-5]) 
% imshow (img_sc)
% %% obrada slike ! gaus_crop
% 
% 
% img_gg = rgb2gray(img_gaussfilt); %grey - gaus
% figure
% imshow (img_gg)
% 
% %img_tgg= im2bw(img_gg, 0.5);
% % 
%  level = graythresh(img_gg);
%  img_tgg = im2bw(img_gg, level); %treshhold - grey - gaus
%  figure
%  imshow (img_tgg)
% 
% % struct_element = strel('square', 5);
% % img_ertgg = imdilate(img_tgg, struct_element); %erode - treshold - grey- gaus
% % figure
% % imshow (img_ertgg)
% img_ertgg = bwmorph (img_tgg, 'open');
% figure
% imshow (img_ertgg)
% 
% % 
% %img_fill = imfill (img_ertgg, 'holes');
% % figure 
% % imshow (img_fill)
% 
% img_rub = edge(img_ertgg, 'canny');
% figure
% imshow (img_rub)