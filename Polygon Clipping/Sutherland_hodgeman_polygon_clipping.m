function [ ] = Sutherland_hodgeman_polygon_clipping( vertex_list )

    [size_x size_y] = size(vertex_list);
    
    vertex_list = [vertex_list vertex_list(1)];
    xmin=200;
    ymin=20;
    xmax=400;
    ymax=210;
    
    xvmin = 200;
    yvmin = 300;
    xvmax = 400;
    yvmax = 480;
    
    draw_x = [];
    draw_y = [];
    
    for j = 1:size_y+1
        draw_x(j) = vertex_list(j).x;
        draw_y(j) = vertex_list(j).y;
    end
    
    plot(draw_x, draw_y);
    
    pointx = [xmin xmax  xmax xmax xmin xmax xmin xmin];
    pointy = [ymin ymin ymin ymax ymax ymax ymax ymin];
    hold on;
    plot(pointx, pointy);
    
    pointx = [xvmin xvmax  xvmax xvmax xvmin xvmax xvmin xvmin];
    pointy = [yvmin yvmin yvmin yvmax yvmax yvmax yvmax yvmin];
    hold on;
    plot(pointx, pointy,'r');
    
    for i = 0:3
            curr = 2^i;
            
            new_vertex_list = [];
            count = 1;
            current = 1;
            next = 2;
            [size_x size_y] = size(vertex_list);
            
            while current <= size_y
               
                if (next == size_y)
                    next = 1;
                end
                
                p_1 = vertex_list(current);
                p_2 = vertex_list(next);
                
                code_1 = find_code( p_1,i);
                code_2 = find_code( p_2 ,i);
                result  = bitand(code_1,code_2);
                cod1_res = bitand(code_1,curr);
                cod2_res = bitand(code_2,curr);
                
                if(result)
                    % both are inside
                    new_vertex_list = [new_vertex_list vertex_list(next)];
                    count = count  + 1;
                elseif(cod1_res)
                    % inside to out
                    % push the intersection point
                   
                    p = struct('x',0,'y',0);                  
                    if(i== 0)   
                        p.x =  p_1.x + (p_2.x - p_1.x)*(ymax-p_1.y)/(p_2.y - p_1.y);
                        p.y = ymax;
                    elseif(i == 1)
                        p.x = xmax;
                        p.y = p_1.y + (p_2.y - p_1.y) * (xmax - p_1.x)/(p_2.x - p_1.x);     
                    elseif(i == 2)
                        p.x= p_1.x+(p_2.x - p_1.x)*(ymin- p_1.y)/(p_2.y - p_1.y);
                        p.y = ymin;
                    elseif(i == 3)
                        p.x = xmin;
                        p.y = p_1.y + (p_2.y - p_1.y) * (xmin - p_1.x)/(p_2.x - p_1.x);  
                    end
                    new_vertex_list = [new_vertex_list p];
                    count = count + 1;
                    
                elseif(cod2_res)
                   % out to in
                 
                    p = struct('x',0,'y',0);    
                    if(i== 0)
                        p.x =p_1.x + (p_2.x - p_1.x)*(ymax-p_1.y)/(p_2.y - p_1.y);
                        p.y = ymax;       
                    elseif(i == 1)
                        p.x = xmax;
                        p.y = p_1.y + (p_2.y - p_1.y) * (xmax - p_1.x)/(p_2.x - p_1.x);          
                    elseif(i == 2)
                        p.x= p_1.x+(p_2.x - p_1.x)*(ymin- p_1.y)/(p_2.y - p_1.y);
                        p.y = ymin;                
                    elseif(i == 3)
                        p.x = xmin;
                        p.y = p_1.y + (p_2.y - p_1.y) * (xmin - p_1.x)/(p_2.x - p_1.x);
                    end
              		new_vertex_list = [new_vertex_list p];
                    count = count + 1 ;
              		new_vertex_list =  [new_vertex_list vertex_list(next)];
                    count = count + 1; 
                else   
                    % both outside    
                end     
                current = current + 1;
                next = next + 1;
            end
            vertex_list = new_vertex_list;
            vertex_list = [ vertex_list vertex_list(1)];        
    end
    
    draw_x = [];
    draw_y = [];
    
    [size_x size_y] = size(vertex_list);
    
    scale_x=(xvmax-xvmin)/(xmax-xmin);
    scale_y=(yvmax-yvmin)/(ymax-ymin);
    
    for j = 1:size_y
        draw_x(j) = xvmin + (vertex_list(j).x - xmin) * scale_x; 
        draw_y(j) = yvmin + (vertex_list(j).y - ymin) * scale_y; 
    end
    plot(draw_x, draw_y,'green');
end


