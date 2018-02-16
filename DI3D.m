function varargout = DI3D(varargin)
% DI3D MATLAB code for DI3D.fig
%      DI3D, by itself, creates a new DI3D or raises the existing
%      singleton*.
%
%      H = DI3D returns the handle to a new DI3D or the handle to
%      the existing singleton*.
%
%      DI3D('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DI3D.M with the given input arguments.
%
%      DI3D('Property','Value',...) creates a new DI3D or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DI3D_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DI3D_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DI3D

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DI3D_OpeningFcn, ...
                   'gui_OutputFcn',  @DI3D_OutputFcn, ...
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


% --- Executes just before DI3D is made visible.
function DI3D_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DI3D (see VARARGIN)

% Choose default command line output for DI3D
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

backgroundImage =importdata('sunset-beach.jpg');
% 选择坐标系
axes(handles.axes1);
% 将图片添加到坐标系中，于是就成了背景了
image(backgroundImage);
% 将坐标系的坐标轴标签去掉
axis off


% UIWAIT makes DI3D wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DI3D_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
calib_gui
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
stereo_gui
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
i1=imread('F:\graduation project\LeftI.bmp'); 
i11=rgb2gray(i1); 
imwrite(i11,'v1.jpg','quality',80); 
[image, descrips, locs] = sift('v1.jpg');   
showkeys(image, locs);  
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
i1=imread('F:\graduation project\LeftI.bmp');  
i2=imread('F:\graduation project\RightI.bmp');  
i11=rgb2gray(i1);  
i22=rgb2gray(i2);  
imwrite(i11,'v1.jpg','quality',80);  
imwrite(i22,'v2.jpg','quality',80);  
match('v1.jpg','v2.jpg'); 
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
i1=imread('F:\graduation project\LeftI.bmp');  
i2=imread('F:\graduation project\RightI.bmp');  
i11=rgb2gray(i1);  
i22=rgb2gray(i2);  
imwrite(i11,'v1.jpg','quality',80);  
imwrite(i22,'v2.jpg','quality',80);  


[im1, des1, loc1] = sift('v1.jpg');
[im2, des2, loc2] = sift('v2.jpg');

distRatio = 0.6;   
des2t = des2';                          
for i = 1 : size(des1,1)
   dotprods = des1(i,:) * des2t;        
   [vals,indx] = sort(acos(dotprods));  
   
   if (vals(1) < distRatio * vals(2))
      match(i) = indx(1);
   else
      match(i) = 0;
   end
end
 j = 1;
for i = 1: size(des1,1)
  if (match(i) > 0)
  XL(1,j) = loc1(i,1);
  XL(2,j) = loc1(i,2);
  XR(1,j) = loc2(match(i),1);
  XR(2,j) = loc2(match(i),2);
  j=j+1;
  end
end
load Calib_Results_stereo;
[Xc_1_left,Xc_1_right] = stereo_triangulation(XL,XR,om,T,fc_left,cc_left,kc_left,alpha_c_left,fc_right,cc_right,kc_right,alpha_c_right);
figure;
scatter3(Xc_1_left(1,:),Xc_1_left(2,:),Xc_1_left(3,:),'.');

x=Xc_1_left(1,:);
y=Xc_1_left(2,:);
z=Xc_1_left(3,:);
tri = delaunay(x,y);  
figure   
trimesh(tri,x,y,z); 


x=Xc_1_left(1,:);
y=Xc_1_left(2,:);
z=Xc_1_left(3,:);
xmin = min(x);
xmax = max(x);
ymin = min(y);
ymax = max(y);
F = TriScatteredInterp(x(:),y(:),z(:));  %# Create interpolant
N = 50;  %# Number of y values in uniform grid
M = 50;  %# Number of x values in uniform grid
xu = linspace(xmin,xmax,M);      %# Uniform x-coordinates
yu = linspace(ymin,ymax,N);      %# Uniform y-coordinates
[X,Y] = meshgrid(xu,yu);         %# Create meshes for xu and yu
Z = F(X,Y);                      %# Evaluate interpolant (N-by-M matrix)
C = imread('hhhh.jpg');        %# Load RGB image
h = surf(X,Y,Z,flipdim(C,1), 'FaceColor','texturemap', 'EdgeColor','none');
axis equal







% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
