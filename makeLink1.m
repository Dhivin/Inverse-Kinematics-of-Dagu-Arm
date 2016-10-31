function p = makeLink1(parentAxes, faceColor)
if (nargin == 0)
    parentAxes = gca;
    faceColor = [.7 .7 .7];
elseif (nargin == 1)
    faceColor = [.7 .7 .7];
end
set(parentAxes, 'DataAspectRatio', [1 1 1]);
link1Verts = [-0.8	-0.65	0.75,
    -0.8	-0.65	-0.75,
    1.5	-0.65	-0.75,
    1.5	-0.65	0.75,
    -0.8	0.65	0.75,
    -0.8	0.65	-0.75,
    1.5	0.65	-0.75,
    1.5	0.65	0.75,
    1.5	0	0.25,
    1.5	0	-0.25,
    2.5	0	-0.25,
    2.5	0	0.25];
link1Faces = [1 2 3 4;
    1 2 6 5;
    2 3 7 6;
    3 4 8 7;
    4 1 5 8;
    5 6 7 8;
    9 10 11 12];

p = patch('Parent', parentAxes, 'Faces',link1Faces,'Vertices',link1Verts,'FaceColor',faceColor);

end