function h = image3(im,ij2xyz,handle)
% Display a 2-D image in Matlab xyz 3-D space
% h = image3(C, IJ2XYZ, handle)
% Hardcoded constants
stepsize = 1; % Determines number of tiles in image. It is most efficient
              % to set this to 1, but a higher number might render better
              % graphics when the image is distorted a lot by the
              % perspective mapping of the camera. 

if ndims(im) == 2         %Scalar mode
  imsize = size(im);
elseif ndims(im) == 3     %RGB mode
  imsize = size(im);
  imsize = imsize(1:2);
else
  error('Only scalar and RGB images supported')
end


% Create the slice
[uu,vv] = ndgrid(0:stepsize:1, 0:stepsize:1);
% ij2xyz refers to voxel centers. Therefore we need to 
% add half a pixel to each size of the slice.
irange = [0.5 imsize(1)+0.5];
jrange = [0.5 imsize(2)+0.5];
% Create three 2D arrays giving the ijk coordinates for 
% this slice.
iidx = irange(1) + uu*(irange(2)-irange(1));
jidx = jrange(1) + vv*(jrange(2)-jrange(1));

% Map these 2D ijk arrays to xyz
x = ij2xyz(1,1)*iidx + ij2xyz(1,2)*jidx + + ij2xyz(1,3);
y = ij2xyz(2,1)*iidx + ij2xyz(2,2)*jidx + + ij2xyz(2,3);
z = ij2xyz(3,1)*iidx + ij2xyz(3,2)*jidx + + ij2xyz(3,3);


if nargin<3 || handle == 0
  % Make a new surface
  h = surface('XData',x,'YData',y,'ZData',z,...
	      'CData', im,...
	      'FaceColor','texturemap',...
	      'EdgeColor','none',...
	      'LineStyle','none',...
	      'Marker','none',...
	      'MarkerFaceColor','none',...
	      'MarkerEdgeColor','none',...
	      'CDataMapping','direct');
else
  % Reuse old surface
  set(handle,'XData',x,'YData',y,'ZData',z,'CData',im);
  h = handle;
end

% Just to be sure...
set(gcf,'renderer','opengl');
%set(gcf,'renderer','zbuffer');