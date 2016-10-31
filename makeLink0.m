function p = makeLink0(parentAxes, faceColor)
if (nargin == 0)
    parentAxes = gca;
    faceColor = [.9 .9 .9];
elseif (nargin == 1)
    faceColor = [.9 .9 .9];
end
set(parentAxes, 'DataAspectRatio', [1 1 1]);
link0Verts = [-1.75	-2.15	-2.5;
    -1.75	2.85	-2.5;
    13.25	2.85	-2.5;
    13.25	-2.15	-2.5;
    -1.375	-0.375	-2.5;
    -1.375	0.375	-2.5;
    0.75	0.375	-2.5;
    0.75	-0.375	-2.5;
    -1.375	-0.375	-0.75;
    -1.375	0.375	-0.75;
    0.75	0.375	-0.75;
    0.75	-0.375	-0.75];
link0Faces = [1 2 3 4;
    5 6 10 9;
    6 7 11 10;
    7 8 12 11;
    8 5 9 12;
    9 10 11 12];
p = patch('Parent', parentAxes, 'Faces',link0Faces,'Vertices',link0Verts,'FaceColor',faceColor);

end