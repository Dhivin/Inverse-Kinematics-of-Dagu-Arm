function p = makeLink4(parentAxes, faceColor)
if (nargin == 0)
    parentAxes = gca;
    faceColor = [.7 .7 .7];
elseif (nargin == 1)
    faceColor = [.7 .7 .7];
end
set(parentAxes, 'DataAspectRatio', [1 1 1]);
link4Verts = [-0.45	-1.18	-0.45
    -0.45	-1.06	-0.45
    -0.45	1.06	-0.45
    -0.45	1.18	-0.45
    0.45	1.18	-0.45
    0.45	1.06	-0.45
    0.45	-1.06	-0.45
    0.45	-1.18	-0.45
    -0.45	-1.06	1.12
    -0.45	1.06	1.12
    0.45	1.06	1.12
    0.45	-1.06	1.12
    -0.45	-1.18	1.89
    -0.45	1.18	1.89
    0.45	1.18	1.89
    0.45	-1.18	1.89];
link4Faces = [1 2 7 8;
    3 4 5 6;
    %1 2 9 10 3 4 14 13;
    1 2 9 13;
    9 10 14 13;
    3 4 14 10;
    4 5 15 14;
    %5 6 11 12 7 8 16 15;
    5 6 11 15;
    11 12 16 15;
    7 8 16 12;
    8 1 13 16;
    
    2 7 12 9;
    6 3 10 11;
    9 10 11 12;
    13 14 15 16];

p = patch('Parent', parentAxes, 'Faces',link4Faces,'Vertices',link4Verts,'FaceColor',faceColor);

end


