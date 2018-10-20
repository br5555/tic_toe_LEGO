%% image grabbing 
function [stat]=say_cheese(check)
    imaqreset
    
    
    vidObj = videoinput('winvideo', 1, 'YUY2_640x480'); 
%     if camera supports it, you can use RGB24_640x480 directly
%     to check camera properties use imaqhwinfo('winvideo') and check
%     SupportedFormats in DeviceInfo field of the returned variable

    vidObj.ReturnedColorSpace = 'rgb';
    start(vidObj);
    img = getdata(vidObj);
    img = img(:,:,(1:3));
    %imshow(img);title('Input image');
    stop(vidObj);
    RGB = img;

   % RGB = imread ('test3.jpg');
    analiza;
    %ploc;

    if not( check )

        k = 1;
        for i = 1:3
            for j = 1:3
                if p(k) == 1 
                    stat(i,j) = 0;
                elseif p(k) == -1
                    stat(i,j) = 1;
                elseif p(k) == 0
                    stat(i,j) = -1;
                end
                k = k + 1;
            end
        end
        
        %izvan_nesto = izvan_krugovi;

    else

        k = 1;
        for i = 1:3
            for j = 1:3
                if p(k) == 1 
                    stat(i,j) = 1;
                elseif p(k) == -1
                    stat(i,j) = 0;
                elseif p(k) == 0
                    stat(i,j) = -1;
                end
                k = k + 1;
            end
        end
        
        %izvan_nesto = izvan_iksevi;

    end

end