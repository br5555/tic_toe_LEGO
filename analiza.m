%% obrada slike pokusaj #2
% clc 
% clear all
% RGB = imread ('test2.jpg')


%% Obrada slike u potrazi za trokutima

RGB1 = RGB;
figure 
%imshow (RGB1)
title ('original image')

% RGB -> GRAY
GREY = rgb2gray(RGB1);
% figure 
% imshow(GREY)
% title ('graycale')
%
% GRAY -> GAUS
gauss_filt = fspecial('gaussian', [100,100], 1);
GAUS = imfilter(GREY, gauss_filt);
GAUS_C = imcrop(GAUS, [10 10 size(GAUS,2)-10 size(GAUS,1)-10]);
%figure();imshow(GAUS_C);title('Gaussian filter');

% GAUS -> TRESH

level = graythresh(GAUS_C);
TRESH = im2bw(GAUS_C,level);
% figure
% imshow (TRESH)
% title ('treshholding')

% INVERT IMG

TRESH_I = ~TRESH;
% figure 
% imshow (TRESH_I)
% title ('INVERT')

[B,L, A] = bwboundaries(TRESH_I, 'noholes');
colors=['b' 'g' 'r' 'c' 'm' 'y'];
figure

STATS = regionprops(L, 'all'); 
j = 1;
for i = 1:length(STATS)
    if STATS(i).Area>200 
        STATS_D(j) = STATS(i);
        B_D(j) = B(i); 
        j = j + 1;
    end
end

%imshow (TRESH_I)
grid on
hold on 
for k=1:length(B_D),
  boundary = B_D{k};
  cidx = mod(k,length(colors))+1;
  plot(boundary(:,2), boundary(:,1),...
       colors(cidx),'LineWidth',2);
   
   rectangle('position',STATS_D(k).BoundingBox,'Edgecolor','g')
 
  %randomize text position for better visibility
  rndRow = ceil(length(boundary)/(mod(rand*k,7)+1));
  col = boundary(rndRow,2); row = boundary(rndRow,1);
  h = text(col+1, row-1, num2str(k));
  set(h,'Color',colors(cidx),'FontSize',14,'FontWeight','bold');
end


%% Obrada slike u potrazi za krizicima kruzicima

RGB2 = RGB;
%figure 
%imshow (RGB2)
%title ('original image')

[r, c, z] = size(RGB2);
for i=1:r
    for j=1:c
       if   ( (RGB2(i,j,1)>=5 && RGB2(i,j,1)<=100 && RGB2(i,j,2)>=5 &&...
                 RGB2 (i,j,2)<=100 && RGB2(i,j,3)>=5 && RGB2(i,j,3)<=100)||...
                (RGB2(i,j,1)>=50 && RGB2(i,j,1)<=205 && RGB2(i,j,2)>=50 &&...
                 RGB2(i,j,2)<=205 && RGB2(i,j,3)>=50 && RGB2(i,j,3)<=205)||...
                (RGB2(i,j,1)>=200 && RGB2(i,j,2)>=200 &&...
                 RGB2(i,j,3)>=200 ) ) 
             
            RGB2(i,j,1)=255; RGB2(i,j,2)=255; RGB2(i,j,3)=255;
        end
        %change value out of white
    end
end
% 
% figure 
% imshow (RGB2)
% title ('original image')
% 

%  figure
%  SMALL = imresize (RGB, 0.5);
%  imshow (SMALL)
%  title ('small img')
 %RGB -> GRAY
GREY = rgb2gray(RGB2);
% figure 
% imshow(GREY)
% title ('graycale')
% 
%GRAY -> GAUS
gauss_filt = fspecial('gaussian', [100,100], 1);
GAUS = imfilter(GREY, gauss_filt);
GAUS_C = imcrop(GAUS, [10 10 size(GAUS,2)-10 size(GAUS,1)-10]);
%sfigure();imshow(GAUS_C);title('Gaussian filter');

%GAUS -> TRESH

%level = graythresh(GREY);
TRESH = im2bw(GAUS_C,0.90);
% figure
% imshow (TRESH)
% title ('treshholding')

BW = bwareaopen (TRESH, 20, 18);
se1 = strel('line',1,90);
BW = imclose(BW,se1);
% se2 = strel('line',5,0);
% BW2 =imclose (BW, se2);
% BW = BW1 + BW2;
%BW = imfill (BW, 'holes');

%INVERT IMG

TRESH_I = ~BW;
% figure 
% imshow (TRESH_I)
% title ('INVERT')

morf = bwmorph (TRESH_I, 'close');

[B2,L2, A2] = bwboundaries(morf, 'noholes');
colors=['b' 'g' 'r' 'c' 'm' 'y'];
figure

STATS2 = regionprops(L2, 'all'); 
j = 1;
for i = 1:length(STATS2)
    if STATS2(i).Area>200 
        STATS2_D(j) = STATS2(i);
        B2_D(j) = B2(i); 
        j = j + 1;
    end
end

%imshow (TRESH_I)
grid on
hold on 
for k=1:length(B2_D),
  boundary = B2_D{k};
  cidx = mod(k,length(colors))+1;
  plot(boundary(:,2), boundary(:,1),...
       colors(cidx),'LineWidth',2);
   
    
    

  %randomize text position for better visibility
  rndRow = ceil(length(boundary)/(mod(rand*k,7)+1));
  col = boundary(rndRow,2); row = boundary(rndRow,1);
  h = text(col+1, row-1, num2str(k));
  set(h,'Color',colors(cidx),'FontSize',14,'FontWeight','bold');
end


%% Definiranje pozicije kruzica (dobrih)
% [centers, radii] = imfindcircles(TRESH_I, [20 25],'ObjectPolarity', 'bright', ...
% 'Sensitivity',0.76,'Method','twostage');

[centers, radii] = imfindcircles(TRESH_I, [20 50],'ObjectPolarity', 'bright', ...
'Sensitivity',0.76,'Method','twostage');
hold on 
%imshow(TRESH_I)
viscircles(centers, radii)
j = 1;
centers_D=[];
% for i = 1:length(radii)
%     if radii(i)<(sum(radii)/length(radii))
%     centers_D(j,1) = centers(i,1);
%     centers_D(j,2) = centers(i,2);
%     j = j+1;
%     end
% end
centers_D = centers 
%% obrada STATSA -> pronalazak trokutica -> pronalazak ostatka polja
disp ('Trokutici su...');
j = 1;
for i = 1:length(STATS_D)
    
    Area = STATS_D(i).Area;
    Perimeter = STATS_D(i).Perimeter;
    CircleMetric = (Perimeter^2)/(4*pi*Area); %circularity metric
    boxArea = STATS_D(i).BoundingBox(3) * STATS_D(i).BoundingBox(4);
    TriangleMetric = Area / boxArea;
    
  %CircleMetric >= 1.1
    if (Area>630 && Area<750 && abs(STATS_D(i).BoundingBox(3) - STATS_D(i).BoundingBox(4))<3 &&  TriangleMetric < 0.6) 
        disp(i);
        dobri(j) = i;
        j = j+1;
    end
    
end

%% 

centar_x =( STATS_D( dobri(1) ).Centroid(1) + STATS_D( dobri(2) ).Centroid(1) )/2  
centar_y =( STATS_D( dobri(1) ).Centroid(2) + STATS_D( dobri(2) ).Centroid(2) )/2 -5
figure 
hold on
%imshow (L2)
r = 22;
viscircles (  [centar_x, centar_y], r) %srediste
viscircles (  [centar_x-2*r, centar_y], r) 
viscircles (  [centar_x+2*r, centar_y], r) 
viscircles (  [centar_x, centar_y+2*r], r) 
viscircles (  [centar_x, centar_y-2*r], r) 
viscircles (  [centar_x+2*r, centar_y+2*r], r)
viscircles (  [centar_x-2*r, centar_y-2*r], r) 
viscircles (  [centar_x+2*r, centar_y-2*r], r) 
viscircles (  [centar_x-2*r, centar_y+2*r], r) 
%% Gdje je kruzic 
p = [0 0 0 0 0 0 0 0 0];
for i = 1:size(centers_D,1)

    if ( (centers_D(i,1)-centar_x)^2 + (centers_D(i,2)-centar_y)^2 )<= r^2
        disp ('Kruzic u 5 polju')
        p(5) = 1; 
    end

    
     if ( (centers_D(i,1)-centar_x)^2 + (centers_D(i,2)-centar_y-2*r)^2 )<= r^2
        disp ('Kruzic u 8 polju')
        p(8) = 1;
     end
     
     if ( (centers_D(i,1)-centar_x)^2 + (centers_D(i,2)-centar_y+2*r)^2 )<= r^2
        disp ('Kruzic u 2 polju')
        p(2) = 1;
     end
     
     if ( (centers_D(i,1)-centar_x+2*r)^2 + (centers_D(i,2)-centar_y)^2 )<= r^2
        disp ('Kruzic u 4 polju')
        p(4) = 1;
     end
     
     if ( (centers_D(i,1)-centar_x-2*r)^2 + (centers_D(i,2)-centar_y)^2 )<= r^2
        disp ('Kruzic u 6 polju')
        p(6) = 1;
     end
     
     if ( (centers_D(i,1)-centar_x+2*r)^2 + (centers_D(i,2)-centar_y+2*r)^2 )<= r^2
        disp ('Kruzic u 1 polju')
        p(1) = 1;
     end
     
     if ( (centers_D(i,1)-centar_x-2*r)^2 + (centers_D(i,2)-centar_y-2*r)^2 )<= r^2
        disp ('Kruzic u 9 polju')
        p(9) = 1;
    end
     
     if ( (centers_D(i,1)-centar_x+2*r)^2 + (centers_D(i,2)-centar_y-2*r)^2 )<= r^2
        disp ('Kruzic u 7 polju')
        p(7) = 1;
     end
     
     if ( (centers_D(i,1)-centar_x-2*r)^2 + (centers_D(i,2)-centar_y+2*r)^2 )<= r^2
        disp ('Kruzic u 3  polju')
        p(3) = 1
     end
end
%% gdje su iksici

%cropamo svaki kvadrat posebno
i = 1;
j = 1; 
detekcija = [];
a1=1;
a2=1; 
a3=1;
a4=1;
a5=1;
a6=1;
a7=1;
a8=1;
a9=1;
% 
% figure
% hold on
% imshow(L2)

for i = 1:size(L2,1)
    for j = 1: size(L2,2)
    
    if ( (j-centar_x)^2 + (i-centar_y)^2 )<= r^2
        detekcija(a5,5) = L2(i,j);
        a5 = a5 + 1;
%         hold on
%         plot (j,i,'x');
%     
       
    end
    if ( (j-centar_x+2*r)^2 + (i-centar_y-2*r)^2 )<= r^2
        detekcija(a7, 7) = L2 (i,j);
        a7 = a7 + 1;
%         hold on
%         plot (j,i,'x');
     end
     if ( (j-centar_x)^2 + (i-centar_y-2*r)^2 )<= r^2
         
        detekcija(a8, 8) = L2 (i,j);
        a8 = a8 + 1;
     
     end
     if ( (j-centar_x)^2 + (i-centar_y+2*r)^2 )<= r^2
        detekcija ( a2, 2) = L2 (i,j);
        a2 = a2 + 1;
%         hold on
%         plot (j,i,'o');
%         
     end
     if ( (j-centar_x+2*r)^2 + (i-centar_y)^2 )<= r^2
        detekcija (a4, 4) = L2(i,j);
        a4 = a4 + 1;
%         hold on
%         plot (j,i,'x');
%         
%         
     end
     if ( (j-centar_x-2*r)^2 + (i-centar_y)^2 )<= r^2
        detekcija (a6, 6) = L2(i,j);
        a6 = a6 + 1;
         
     end
     if ( (j-centar_x+2*r)^2 + (i-centar_y+2*r)^2 )<= r^2
        detekcija (a1, 1) = L2(i,j);
        a1 = a1 + 1;
%         hold on
%         plot(j,i,'x');
%         
     end
     if ( (j-centar_x-2*r)^2 + (i-centar_y-2*r)^2 )<= r^2
        detekcija (a9, 9) = L2(i,j);
        a9 = a9 + 1;
        
     end
     if ( (j-centar_x-2*r)^2 + (i-centar_y+2*r)^2 )<= r^2
         detekcija (a3, 3) = L2(i,j);
         a3 = a3 + 1;
     end
    
    end
end



%% detekcija iksica !!!1
i = 1;
j = 1;
suma = [0 0 0 0 0 0 0 0 0];

for i = 1:9
    for j = 1:length(detekcija)
        %disp(detekcija(j,i))
        
        if  detekcija(j,i)>0 || detekcija(j,i)<0 
            
            suma(i) = suma(i) + 1;
           
        end
    end
%     disp('Stupac posto\n')
%     disp (suma(i)/length(detekcija))
end

%% ZBILJA SADA DETEKTIRAMO !
i = 1;
for i=1:9
    if not(p(i)) && suma(i)/1522>0.4
        p(i) = -1;
    end
end
p