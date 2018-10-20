l1 = 15.5;
l2 = 10.5;
v  = 17.8;
g=2.5;
d = sqrt ((x-8.5)^2 + (y-1.25)^2);

% beta=acos((l2^2-d^2-zj^2)/(-2*d*zj) )*180/pi;
% gama=acos((g^2-l1^2-zj^2)/(-2*l1*zj) )*180/pi;
% alfa=acos(x/d)*180/pi;
% t1=alfa-beta+gama;
% 
% f=90-t1;
% p=134-f;
% hehe=90-p;
% 
% veliki=acos((d^2-l2^2-zj^2)/(-2*l2*zj) )*180/pi;
% manji=180-134-gama;
% ok=veliki-manji;
% t2=-(180-t1-ok-hehe);


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


set_param ([handles.model_name '/rotacija1'], 'Value', mat2str(t1) );
set_param ([handles.model_name '/rotacija2'], 'Value', mat2str(t2) );
set_param ([handles.model_name '/translacija'], 'Value', mat2str(z) );

 set(handles.x_os,'String',mat2str(x));
 set(handles.y_os,'String',mat2str(y));
 set(handles.z_os,'String',mat2str(z));

%setaj sve

set (handles.translacija, 'Value', z);
set (handles.rotacija1, 'Value', t1);
set (handles.rotacija2, 'Value', t2);
set (handles.edit3, 'String', z);
set (handles.edit4, 'String', t1);
set (handles.edit5, 'String', t2);
