function p = makeLink3(parentAxes, faceColor)
if (nargin == 0)
    parentAxes = gca;
    faceColor = [.7 .7 .7];
elseif (nargin == 1)
    faceColor = [.7 .7 .7];
end
set(parentAxes, 'DataAspectRatio', [1 1 1]);
link3Verts = [-3.95	-0.59	0.75
    -3.95	-0.59	-0.75
    0.77	-0.59	-0.75
    0.77	-0.59	0.75
    -3.95	0.59	0.75
    -3.95	0.59	-0.75
    0.77	0.59	-0.75
    0.77	0.59	0.75];
link3Faces = [1 2 3 4;
    1 2 6 5;
    2 3 7 6;
    3 4 8 7;
    4 1 5 8;
    5 6 7 8];

p = patch('Parent', parentAxes, 'Faces',link3Faces,'Vertices',link3Verts,'FaceColor',faceColor);

end


