function varargout = combined_gui(varargin)
% COMBINED_GUI M-file for combined_gui.fig
%      COMBINED_GUI, by itself, creates a new COMBINED_GUI or raises the existing
%      singleton*.
%
%      H = COMBINED_GUI returns the handle to a new COMBINED_GUI or the handle to
%      the existing singleton*.
%
%      COMBINED_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMBINED_GUI.M with the given input arguments.
%
%      COMBINED_GUI('Property','Value',...) creates a new COMBINED_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before combined_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to combined_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help combined_gui

% Last Modified by GUIDE v2.5 29-Apr-2011 00:08:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @combined_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @combined_gui_OutputFcn, ...
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


% --- Executes just before combined_gui is made visible.
function combined_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to combined_gui (see VARARGIN)

% Choose default command line output for combined_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes combined_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = combined_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(handles.popupmenu1, 'String');
val = get(handles.popupmenu1,'Value');
% Set current data to the selected data set.
switch str{val};
case 'viterbi' % User selects peaks.
   run Viterbi_decoding_gui
case 'trellis' % User selects membrane.
   run Trellis_coding_gui
case 'cyclic' % User selects sinc.
   run Cyclic_codec_gui
end



% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
