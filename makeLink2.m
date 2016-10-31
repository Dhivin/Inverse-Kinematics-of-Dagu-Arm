function p = makeLink2(parentAxes, faceColor)
if (nargin == 0)
    parentAxes = gca;
    faceColor = [.7 .7 .7];
elseif (nargin == 1)
    faceColor = [.7 .7 .7];
end
set(parentAxes, 'DataAspectRatio', [1 1 1]);
link2Verts = [-3.65	-0.5	1.18
    -3.65	-0.5	1.06
    0.5	-0.5	1.06
    0.5	-0.5	1.18
    -3.65	0.5	1.18
    -3.65	0.5	1.06
    0.5	0.5	1.06
    0.5	0.5	1.18
    -3.65	-0.5	-1.06
    -3.65	-0.5	-1.18
    0.5	-0.5	-1.18
    0.5	-0.5	-1.06
    -3.65	0.5	-1.06
    -3.65	0.5	-1.18
    0.5	0.5	-1.18
    0.5	0.5	-1.06];
link2Faces = [1 2 3 4;
    1 2 6 5;
    2 3 7 6;
    3 4 8 7;
    4 1 5 8;
    5 6 7 8;
    9 10 11 12;
    9 10 14 13;
    10 11 15 14;
    11 12 16 15;
    12 9 13 16;
    13 14 15 16];

p = patch('Parent', parentAxes, 'Faces',link2Faces,'Vertices',link2Verts,'FaceColor',faceColor);

end


