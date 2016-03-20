##Polygon Clipping

#Sutherland Hodgman Polygon Clipping Algorithm
The Sutherland–Hodgman algorithm is used for clipping polygons. It works by extending each line of the convex clip polygon in turn and selecting only vertices from the subject polygon that are on the visible side.

##How to run
* p1 = struct('x',210,'y',90);
* p2 = struct('x',300,'y',10);
* p3 = struct('x',420,'y',90);
* p4 = struct('x',300,'y',220);
* vertex_list = [p1 p2 p3 p4];
* Sutherland_hodgeman_polygon_clipping(vertex_list);


##Basic Idea
* The Sutherland-Hodgman algorithm clips a polygon against all edges of the clipping region
in turn.
* The algorithm steps from vertex to vertex, adding 0, 1, or 2 vertices to the output list at
each step.
![Cases ](https://github.com/mamexo/Matlab/blob/master/Polygon%20Clipping/img/case.png)
* There are 4 cases that can happen :
 * Assuming vertex A has already been processed,
 * Case 1 — vertex B is added to the output list
 * Case 2 — vertex B’ is added to the output (edge AB is clipped to AB’)
 * Case 3 — no vertex added (segment AB clipped out)
 * Case 4 — vertices A’ and B are added to the output (edge AB is clipped to A’B)
## Demo Output
![Polygon Clipping demo ](https://github.com/mamexo/Matlab/blob/master/Polygon%20Clipping/img/matlab_polygon_clipping.png)
