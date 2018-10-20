%%
%PROMIJENITI KADA SMO NA DRUGOJ STRANI poc_x i poc_y !!!1

RGB1 = RGB;
figure 
imshow (RGB1)
title ('original image')

% RGB -> GRAY
GREY = rgb2gray(RGB1);
figure 
imshow(GREY)
title ('graycale')
%
% GRAY -> GAUS
gauss_filt = fspecial('gaussian', [100,100], 0.5);
GAUS = imfilter(GREY, gauss_filt);
GAUS_C = imcrop(GAUS, [10 10 size(GAUS,2)-10 size(GAUS,1)-10]);
figure();imshow(GAUS_C);title('Gaussian filter');

% GAUS -> TRESH

level = graythresh(GAUS_C);
TRESH = im2bw(GAUS_C,level);
figure
imshow (TRESH)
title ('treshholding')

% INVERT IMG

TRESH_I = ~TRESH;
figure 
imshow (TRESH_I)
title ('INVERT')

[B3,L3, A3] = bwboundaries(TRESH, 'noholes');
colors=['b' 'g' 'r' 'c' 'm' 'y'];
figure

STATS3 = regionprops(L3, 'all'); 
j = 1;
for i = 1:length(STATS3)
    if STATS3(i).Area>200 
        STATS3_D(j) = STATS3(i);
        B3_D(j) = B3(i); 
        j = j + 1;
    end
end

imshow (TRESH_I)
grid on
hold on 
for k=1:length(B3_D),
  boundary = B3_D{k};
  cidx = mod(k,length(colors))+1;
  plot(boundary(:,2), boundary(:,1),...
       colors(cidx),'LineWidth',2);
   
   rectangle('position',STATS3_D(k).BoundingBox,'Edgecolor','g')
 
  %randomize text position for better visibility
  rndRow = ceil(length(boundary)/(mod(rand*k,7)+1));
  col = boundary(rndRow,2); row = boundary(rndRow,1);
  h = text(col+1, row-1, num2str(k));
  set(h,'Color',colors(cidx),'FontSize',14,'FontWeight','bold');
end

%%
%koeficijent prijenosa u pikesele
% koef = sqrt ( ( ( (STATS3( dobri(1) ).Centroid(1) - STATS3( dobri(2)).Centroid(1) ) )^2 +...
%     ( STATS3 (dobri(1)).Centroid(2) - STATS3(dobri(2)).Centroid(2)) )^2 ) / 18;

%pocetna pozicija robota (Lovro)
% poc_x = centar_x - 3*r;
% poc_y = centar_y;
%%%%%%%%%%%%%%%%%%%%%%%%%%
%TU MORAMO MIJENJATI ILI SMO NA 
% poc_y = centar_y + 3*r + 10;
% poc_x = centar_x + 10;
%GORE ILI....
poc_y = centar_y - 3*r + 10;
poc_x = centar_x + 10;
%DOLJE !
%%%%%%%%%%%%%%%%%5
%racunanje bounding box rubova
format_A4 = 210/297;
box = 0;
for i=1:length(STATS3_D)
    disp (i)
    str1 = STATS3_D(i).BoundingBox(3);  
    str2 = STATS3_D(i).BoundingBox(4);    
    format_piks = str1 / str2;            
    if format_piks > 1 
        format_piks = str2 / str1;
    end
    
    if ( (abs( format_A4 - format_piks )<0.03) && ((STATS3_D(i).Area)>50000) && ( STATS3_D(i).Area<80000 ) ...
           )
        
        box = i;
        break
    end
    
end
disp (box)

%koeficijent prijenosa u pikesele
% koef = sqrt   (  ( STATS_D( dobri(1) ).Centroid(1) - STATS_D( dobri(2)).Centroid(1) ) ^2 +...
%     ( STATS_D(dobri(1)).Centroid(2) - STATS_D(dobri(2)).Centroid(2))^2  )/ 18;


bb1 = STATS3_D(box).BoundingBox(3);
bb2 = STATS3_D(box).BoundingBox(4);

if bb1 > bb2
    koef = bb2/21;
else
    koef = bb1/21;
end

izvan_krugovi = [];
j = 1;

sirina = STATS3_D(box).BoundingBox(1) + STATS3_D(box).BoundingBox(3);
duzina = STATS3_D(box).BoundingBox(2) + STATS3_D(box).BoundingBox(4);
 
for i= 1:size(centers_D,1)
    disp ('bla')
    if ( ( ( centers_D(i,1)>sirina ) || (centers_D(i,1)<STATS3_D(box).BoundingBox(1) ) )...
            || ( ( centers_D(i,2)>duzina ) || (centers_D(i,2)<STATS3_D(box).BoundingBox(2) ) ) )
        
        izvan_krugovi (j, 1) = centers_D(i,1)+10;
        izvan_krugovi (j, 2) = centers_D(i,2)+10;
        j = j + 1;
    end
    
end


%array offseta u odnosu na pocetnu poziciju alata
%pocetna pozicija u CENTIMETRIMA !!!

poc_xCM = 37.5;
poc_yCM = 0;

for i=1:size(izvan_krugovi,1)

    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %KAD IMAMO ROBOTA DOLE ONDA RACUNAJ OVAKO !!1
    %
    
    pos_krugovi(i,2) = (poc_x - izvan_krugovi(i,1))/koef + poc_yCM;
    pos_krugovi(i,1) = (poc_y - izvan_krugovi(i,2))/koef + poc_xCM;
end
%% detekcija iksica izvan 
% 
% RGB2 = RGB;
% figure 
% imshow (RGB2)
% title ('original image')
% 
% [r, c, z] = size(RGB2);
% for i=1:r
%     for j=1:c
%         if   ( (RGB2(i,j,1)>=5 && RGB2(i,j,1)<=80 && RGB2(i,j,2)>=5 &&...
%                  RGB2 (i,j,2)<=80 && RGB2(i,j,3)>=5 && RGB2(i,j,3)<=80)||...
%                 (RGB2(i,j,1)>=50 && RGB2(i,j,1)<=220 && RGB2(i,j,2)>=50 &&...
%                  RGB2(i,j,2)<=220 && RGB2(i,j,3)>=50 && RGB2(i,j,3)<=220)||...
%                 (RGB2(i,j,1)>=240 && RGB2(i,j,2)>=240 &&...
%                  RGB2(i,j,3)>=130 ) ) 
%             
%             RGB2(i,j,1)=255; RGB2(i,j,2)=255; RGB2(i,j,3)=255;
%         end
%         %change value out of white
%     end
% end
% 
% figure 
% imshow (RGB2)
% title ('original image')
% 
% 
% %  figure
% %  SMALL = imresize (RGB, 0.5);
% %  imshow (SMALL)
% %  title ('small img')
%  %RGB -> GRAY
% GREY = rgb2gray(RGB2);
% figure 
% imshow(GREY)
% title ('graycale')
% % 
% %GRAY -> GAUS
% gauss_filt = fspecial('gaussian', [100,100], 1);
% GAUS = imfilter(GREY, gauss_filt);
% GAUS_C = imcrop(GAUS, [10 10 size(GAUS,2)-10 size(GAUS,1)-10]);
% figure();imshow(GAUS_C);title('Gaussian filter');
% 
% %GAUS -> TRESH
% 
% %level = graythresh(GREY);
% TRESH = im2bw(GAUS_C,0.90);
% figure
% imshow (TRESH)
% title ('treshholding')
% 
% BW = bwareaopen (TRESH, 20, 18);
% se1 = strel('line',1,90);
% BW = imclose(BW,se1);
% % se2 = strel('line',5,0);
% % BW2 =imclose (BW, se2);
% % BW = BW1 + BW2;
% %BW = imfill (BW, 'holes');
% 
% %INVERT IMG
% 
% TRESH_I = ~BW;
% figure 
% imshow (TRESH_I)
% title ('INVERT')

morf = bwmorph (TRESH, 'close');

[B4,L4, A4] = bwboundaries(morf, 'noholes');
colors=['b' 'g' 'r' 'c' 'm' 'y'];
figure

STATS4 = regionprops(L4, 'all'); 
j = 1;
for i = 1:length(STATS4)
    if STATS4(i).Area>200 
        STATS4_D(j) = STATS4(i);
        B4_D(j) = B4(i); 
        j = j + 1;
    end
end

imshow (TRESH_I)
grid on
hold on 
for k=1:length(B4_D),
  boundary = B4_D{k};
  cidx = mod(k,length(colors))+1;
  plot(boundary(:,2), boundary(:,1),...
       colors(cidx),'LineWidth',2);
   
  rectangle('position',STATS4_D(k).BoundingBox,'Edgecolor','g')
 
  %randomize text position for better visibility
  rndRow = ceil(length(boundary)/(mod(rand*k,7)+1));
  col = boundary(rndRow,2); row = boundary(rndRow,1);
  h = text(col+1, row-1, num2str(k));
  set(h,'Color',colors(cidx),'FontSize',14,'FontWeight','bold');
end


%% detekcija iksica izvan opet
j = 1;

izvan_iksevi = [];

for i=1:length(STATS3_D)
    
    % detekcija za iksic
    %iksic -> kocka BB, 1000<AREA<2000, AREA / BB_AREA
    
    disp (i)
    str = abs (STATS3_D(i).BoundingBox(3) - STATS3_D(i).BoundingBox(4));
    pov = STATS3_D(i).Area;
    omjer = STATS3_D(i).Area/(STATS3_D(i).BoundingBox(3) * STATS3_D(i).BoundingBox(4));

    if ( str  <= 3  ) &&...
            ( pov>800 ) && ( pov<1000 ) &&...
            ( omjer < 0.58 ) 
     
        
        xx = STATS4_D(i).Centroid(1);
        yy = STATS4_D(i).Centroid(2);
       
        if ( ( ( xx>sirina ) || (xx < STATS3_D(box).BoundingBox(1) ) )...
                || ( ( yy>duzina ) || (yy < STATS3_D(box).BoundingBox(2) ) ) )
           disp (i)
            izvan_iksevi (j, 1) = xx + 10;
            izvan_iksevi (j, 2) = yy + 10;
            j = j + 1;
        end

    end
    
end

poc_xCM = 37.5;
poc_yCM = 0;


for i=1:size(izvan_iksevi,1)
    
     pos_iksevi(i,2) = (poc_x - izvan_iksevi(i,1))/koef + poc_yCM;
    pos_iksevi(i,1) = (poc_y - izvan_iksevi(i,2))/koef + poc_xCM;
   
    %za gore
%     pos_iksevi(i,2) = (izvan_iksevi(i,1) - poc_x)/koef + poc_xCM;
%     pos_iksevi(i,1) = (izvan_iksevi(i,2)- poc_y )/koef + poc_yCM;
end
