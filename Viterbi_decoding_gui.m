function varargout = Viterbi_decoding_gui(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Viterbi_decoding_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @Viterbi_decoding_gui_OutputFcn, ...
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


% --- Executes just before Viterbi_decoding_gui is made visible.
function Viterbi_decoding_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Viterbi_decoding_gui (see VARARGIN)

% Choose default command line output for Viterbi_decoding_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Viterbi_decoding_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Viterbi_decoding_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

clear;
clc;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mes = str2mat(get(handles.edit1,'string'));
for i=1:length(mes)
    M(i)=str2num(mes(i));
end
trel = poly2trellis(3,[3,4]);
code = convenc(M,trel);
set(handles.edit2,'string',num2str(code));
% tblen = 4;
% opmode = 'trunc';
% dectype = 'hard';
% decoded = vitdec(code,trel,tblen,opmode,dectype);
% set(handles.edit3,'string',num2str(decoded));
stem(handles.axes1,code,'rx')
xlabel('Time')
ylabel('Amplitude')
title('Message after Encoding')
grid on

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
mes = str2mat(get(handles.edit1,'string'));
for i=1:length(mes)
    M(i)=str2num(mes(i));
end
stem(handles.axes1,M)
xlabel('Time')
ylabel('Amplitude')
title('Message before Encoding')
grid on

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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
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

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
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
mes = str2mat(get(handles.edit1,'string'));
for i=1:length(mes)
    M(i)=str2num(mes(i));
end
trel = poly2trellis(3,[3,4]);
code = convenc(M,trel);
% set(handles.edit2,'string',num2str(code));
tblen = 4;
opmode = 'trunc';
dectype = 'hard';
decoded = vitdec(code,trel,tblen,opmode,dectype);
% set(handles.edit3,'string',num2str(decoded));
if(M==decoded)
    msgbox('Decoding done successfully');
else
    msgbox('Decoding failed');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

mes = str2mat(get(handles.edit1,'string'));
for i=1:length(mes)
    M(i)=str2num(mes(i));
end
trel = poly2trellis(3,[3,4]);
code = convenc(M,trel);
% set(handles.edit2,'string',num2str(code));
tblen = 4;
opmode = 'trunc';
dectype = 'hard';
decoded = vitdec(code,trel,tblen,opmode,dectype);
set(handles.edit3,'string',num2str(decoded));
stem(handles.axes1,decoded,'r')
xlabel('Time')
ylabel('Amplitude')
title('Message after Decoding')
grid on


%EOF


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.figure1);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.figure1);
run Viterbi_decoding_gui
