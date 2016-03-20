Line Clipping

Cohen and Sutherland Line Clipping Algorithm

##How to run
* p1 = struct('x',220,'y',200);
* p2 = struct('x',440,'y',30);
* CohenSutherlandLineAlgorithm(p1,p2);


##Steps Involved

*Determine the bit values of the two end-points of the line to be clipped.
* Use these end-point codes to locate the line.
* Various Possibilities
**If both endpoints are 0000, the line lies completely inside the box, no need to clip. This
is the simplest case.
** Any line has 1 in the same bit positions of both the endpoints, it is guaranteed to lie
outside the box completely.
*If any trivial case is not met, obtain an endpoint that lies outside the box.
using the code, obtain the edge that is crossed first.
*Clip w.r.t. the edge.
*Compute the code for the updated endpoint and repeat the iterartion,. till it is 0000.
*Repeat the above steps, if the other endpoint is also outside the area.

## Demo
![Line Clipping demo ](https://github.com/mamexo/Matlab/blob/master/Line%20Clipping/img/matlab_line_clipping.png)
