function p = makeLink5(parentAxes, faceColor)
if (nargin == 0)
    parentAxes = gca;
    faceColor = [.7 .7 .7];
elseif (nargin == 1)
    faceColor = [.7 .7 .7];
end
set(parentAxes, 'DataAspectRatio', [1 1 1]);
link5Verts = [-0.25	-0.5	-5.12
    -0.25	0.5	-5.12
    0.25	0.5	-5.12
    0.25	-0.5	-5.12
    -0.25	-1.2	-3.37
    -0.25	1.2	-3.37
    0.25	1.2	-3.37
    0.25	-1.2	-3.37
    -0.25	-0.35	0
    -0.25	0.35	0
    0.25	0.35	0
    0.25	-0.35	0
    -0.6	-0.64	-4.37
    -0.6	0.5	-4.37
    -2	0.5	-4.37
    -2	-0.64	-4.37
    -0.6	-0.64	-3.87
    -0.6	0.5	-3.87
    -2	0.5	-3.87
    -2	-0.64	-3.87];
link5Faces = [1 2 3 4;
    1 2 6 5;
    2 3 7 6;
    3 4 8 7;
    4 1 5 8;
    5 6 10 9;
    6 7 11 10;
    7 8 12 11;
    8 5 9 12;
    9 10 11 12;
    13 14 15 16;
    13 14 18 17;
    14 15 19 18;
    15 16 20 19;
    16 13 17 20;
    17 18 19 19];

p = patch('Parent', parentAxes, 'Faces',link5Faces,'Vertices',link5Verts,'FaceColor',faceColor);

end


