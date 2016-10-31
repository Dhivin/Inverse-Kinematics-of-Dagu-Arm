function updateArm(hObject, handles,q)
[A1,A2,A3,A4,A5]=makeHomogeneousTransformations(q(1),q(2),q(3),q(4),q(5));
 T0_1 = A1;
T0_2 = A1*A2;
T0_3 = A1*A2*A3;
 T0_4 = A1*A2*A3*A4;
T0_5 = A1*A2*A3*A4*A5
link1verticesWRTground = T0_1 * handles.user.link1Vertices;
link2verticesWRTground = T0_2 * handles.user.link2Vertices;
link3verticesWRTground = T0_3 * handles.user.link3Vertices;
link4verticesWRTground = T0_4 * handles.user.link4Vertices;
 link5verticesWRTground = T0_5 * handles.user.link5Vertices;
 set(handles.user.link1Patch,'Vertices', link1verticesWRTground(1:3,:)');
set(handles.user.link2Patch,'Vertices', link2verticesWRTground(1:3,:)');
 set(handles.user.link3Patch,'Vertices', link3verticesWRTground(1:3,:)');
set(handles.user.link4Patch,'Vertices', link4verticesWRTground(1:3,:)');
 set(handles.user.link5Patch,'Vertices', link5verticesWRTground(1:3,:)');
 
 dhOrigin = [0 0 0 1]';
 gripperWRTground = T0_5 * dhOrigin;
 hold on;
k=scatter3(gripperWRTground(1),gripperWRTground(2),gripperWRTground(3),'*');
 fprintf('(%.3f, %.3f, %.3f)\n', gripperWRTground(1), gripperWRTground(2), gripperWRTground(3));
pause(0.2);
end
