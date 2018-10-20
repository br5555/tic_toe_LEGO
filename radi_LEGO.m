function varargout = radi_LEGO(varargin)
% RADI_LEGO MATLAB code for radi_LEGO.fig
%      RADI_LEGO, by itself, creates a new RADI_LEGO or raises the existing
%      singleton*.
%
%      H = RADI_LEGO returns the handle to a new RADI_LEGO or the handle to
%      the existing singleton*.
%
%      RADI_LEGO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RADI_LEGO.M with the given input arguments.
%
%      RADI_LEGO('Property','Value',...) creates a new RADI_LEGO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before radi_LEGO_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to radi_LEGO_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help radi_LEGO

% Last Modified by GUIDE v2.5 28-May-2016 13:04:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @radi_LEGO_OpeningFcn, ...
                   'gui_OutputFcn',  @radi_LEGO_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before radi_LEGO is made visible.
function radi_LEGO_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to radi_LEGO (see VARARGIN)

% Choose default command line output for radi_LEGO
handles.output = hObject;

% Update handles structure
handles.model_name='lego2'
guidata(hObject, handles)
set_param([handles.model_name '/translacija'],'Value',num2str(0))
set_param([handles.model_name '/rotacija1'],'Value',num2str(0))
set_param([handles.model_name '/rotacija2'],'Value',num2str(0))

% UIWAIT makes radi_LEGO wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = radi_LEGO_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function translacija_Callback(hObject, eventdata, handles)
% hObject    handle to translacija (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val_str=mat2str(get(hObject,'Value'))
sliderValue=get(handles.translacija,'Value');
set_param([handles.model_name '/translacija'],'Value',val_str)
set(handles.edit3,'String',num2str(sliderValue));
set(handles.z_os,'String',num2str(sliderValue));


% --- Executes during object creation, after setting all properties.
function translacija_CreateFcn(hObject, eventdata, handles)
% hObject    handle to translacija (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function rotacija1_Callback(hObject, eventdata, handles)
% hObject    handle to rotacija1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val_str=mat2str(get(hObject,'Value'));
set_param([handles.model_name '/rotacija1'],'Value',val_str)
racun
set(handles.edit4,'String',num2str(sliderValue));
set(handles.x_os,'String',num2str(x));
set(handles.y_os,'String',num2str(y));


% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function rotacija1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotacija1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function rotacija2_Callback(hObject, eventdata, handles)
% hObject    handle to rotacija2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val_str=mat2str(get(hObject,'Value'))
set_param([handles.model_name '/rotacija2'],'Value',val_str)
racun
set(handles.edit5,'String',num2str(sliderValue2));
set(handles.x_os,'String',num2str(x));
set(handles.y_os,'String',num2str(y));

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function rotacija2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotacija2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val=str2double(get(hObject,'String'));
set(handles.translacija,'Value',val);
val1=get(hObject,'String');
set(handles.z_os,'String',val);
set_param([handles.model_name '/translacija'],'Value',val1)


% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

%set(handles.translacija,'Value',str2double(get(handles.edit3,'String')))

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val=str2double(get(hObject,'String'));
set(handles.rotacija1,'Value',val);
val1=get(hObject,'String');
set_param([handles.model_name '/rotacija1'],'Value',val1)
racun
set(handles.x_os,'String',num2str(x));
set(handles.y_os,'String',num2str(y));
% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val=str2double(get(hObject,'String'));
set(handles.rotacija2,'Value',val);
val1=get(hObject,'String');
set_param([handles.model_name '/rotacija2'],'Value',val1)
racun
set(handles.x_os,'String',num2str(x));
set(handles.y_os,'String',num2str(y));

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x_os_Callback(hObject, eventdata, handles)
% hObject    handle to x_os (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: get(hObject,'String') returns contents of x_os as text
%        str2double(get(hObject,'String')) returns contents of x_os as a double


% --- Executes during object creation, after setting all properties.
function x_os_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_os (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y_os_Callback(hObject, eventdata, handles)
% hObject    handle to y_os (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: get(hObject,'String') returns contents of y_os as text
%        str2double(get(hObject,'String')) returns contents of y_os as a double


% --- Executes during object creation, after setting all properties.
function y_os_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y_os (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function z_os_Callback(hObject, eventdata, handles)
% hObject    handle to z_os (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of z_os as text
%        str2double(get(hObject,'String')) returns contents of z_os as a double


% --- Executes during object creation, after setting all properties.
function z_os_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z_os (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = str2double(get(handles.x_os, 'String'));
y = str2double (get(handles.y_os, 'String'));
z = str2double (get(handles.z_os, 'String'));
test2_LEGO

% --- Executes on button press in prvo.
function prvo_Callback(hObject, eventdata, handles)
% hObject    handle to prvo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=34.5;
y=3.8;
test2_LEGO


% --- Executes on button press in drugo.
function drugo_Callback(hObject, eventdata, handles)
% hObject    handle to drugo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=34.5;
y=0;
test2_LEGO

% --- Executes on button press in trece.
function trece_Callback(hObject, eventdata, handles)
% hObject    handle to trece (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=34;
y=-3.8;
test2_LEGO


% --- Executes on button press in cetvrto.
function cetvrto_Callback(hObject, eventdata, handles)
% hObject    handle to cetvrto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=31;
y=3.8;
test2_LEGO

% --- Executes on button press in peto.
function peto_Callback(hObject, eventdata, handles)
% hObject    handle to peto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=30.5;
y=0;
test2_LEGO


% --- Executes on button press in sesto.
function sesto_Callback(hObject, eventdata, handles)
% hObject    handle to sesto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=30.5;
y=-3.8;
test2_LEGO


% --- Executes on button press in sedmo.
function sedmo_Callback(hObject, eventdata, handles)
% hObject    handle to sedmo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=27;
y=3.8;
test2_LEGO

% --- Executes on button press in osmo.
function osmo_Callback(hObject, eventdata, handles)
% hObject    handle to osmo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=27;
y=0;
test2_LEGO


% --- Executes on button press in deveto.
function deveto_Callback(hObject, eventdata, handles)
% hObject    handle to deveto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=27;
y=-3.8;
test2_LEGO


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
xn = 10
yn = 10
zn=8;
z=str2double(get(handles.z_os,'String'));
zz_LEGO
xup=str2double(get(handles.x_os,'String'));
if round(xup)==round(xn)
nije_pravocrtno
else
animacija_LEGO
end
zn=4;
zz_LEGO


% % --- Executes on button press in checkbox1.
% function checkbox1_Callback(hObject, eventdata, handles)
% % hObject    handle to checkbox1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of checkbox1
% g = get(hObject, 'Value');
% if g == 0 
%     x1= get(handles.x_os,'String');
%     y1= get(handles.y_os,'String');
%     z1= get(handles.z_os,'String');
% z2 = 0;
% y2 = -str2double(y1);
% set_param ([handles.model_name '/Constant1'], 'Value', x1);
% set_param ([handles.model_name '/Constant12'], 'Value', mat2str(z2));
% set_param ([handles.model_name '/Constant13'], 'Value',mat2str(y2));
% end
