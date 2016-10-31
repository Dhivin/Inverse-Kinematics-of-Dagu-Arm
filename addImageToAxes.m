function [ imageObject ] = addImageToAxes( imageFilename, axesHandle, axesWidth )
%ADDIMAGETOAXES Adds an image to an axes
% Opens image filename and adds it to the axes
% Returns a handle to the image object.
% If axesWidth = 0 then use the image default pixel size.


% Open the file to get the imageData
[imgData,map,alphaChannel] = imread(imageFilename);

% Create an image object and make the parent the axes
imageObject = image(imgData, 'Parent', axesHandle, 'AlphaData', alphaChannel);

% Make unit of axes 'pixels'
% Visible off
set(axesHandle, 'Visible', 'on', 'Units', 'pixels');

% Get the current 'Position' of the Axes so that we can use the x and y.
currentPosition = get(axesHandle, 'Position');

% Get the number of rows and columns of the image
[rows_height,cols_width,depth] = size(imgData);
axesHeight = axesWidth*rows_height/cols_width;

% If axesWidth = 0
%    axesWidth = num cols
%    axesHeight = num rows
% else
%    Use the axesWidth and aspect ratio to calc height
if axesWidth == 0
    axesWidth = cols_width;
    axesHeight = rows_height;
end

% set the new 'Position' on the axes
set(axesHandle, 'Position', [currentPosition(1), currentPosition(2), axesWidth, axesHeight]);

end

