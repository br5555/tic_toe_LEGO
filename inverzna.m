function [t1, t2] = inverzna(x,y)
    l1 = 15.5;
    l2 = 10.5;

    v  = 17.8;
    g=2.5;
    d = sqrt ((x-8.5)^2 + (y-1.25)^2);

    
    t2 = -(180 - acos((d^2-v^2-l2^2)/(-2*v*l2))*180/pi);
    b = acos( (l2^2-v^2-d^2)/(-2*v*d) )*180/pi;
    a = acos( y/d )*180/pi;
    a1 = asin(y/d)*180/pi;

    if and( (x>=8.5),(y>1.25) )
        t1 = 90 - a - b;
    elseif and( (x<8.5),(y>=1.25) )
        t1 = 180-b-a1;
    elseif and(x>8.5,(y<=1.25))
        t1 =(90 - b - a);
        c=t1-a1;
        t1=a1-c;
        t2=-t2;
    elseif and(x<8.5,(y<=1.25))    
        t1 = 90 - a - b;
        b=-90-(t1);
        t1=b*2+t1;
        t2=-t2;
    end

    
end