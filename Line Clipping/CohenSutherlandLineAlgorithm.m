function [ ] = CohenSutherlandLineAlgorithm( p_1, p_2 )

    xmin=200;
    ymin=20;
    xmax=400;
    ymax=210;
    
    x_points = [p_1.x p_2.x];
    y_points = [p_1.y p_2.y];
    plot(x_points,y_points,'r')
    hold on;
   
    pointx = [xmin xmax  xmax xmax xmin xmax xmin xmin];
    pointy = [ymin ymin ymin ymax ymax ymax ymax ymin];
    hold on;
    plot(pointx, pointy);
   
    code_p_1 = 0;
    code_p_2 = 0;
    intOut = 0;
    done =0;
    draw=0;
    RIGHT =  8;
    LEFT  = 2;
    TOP  = 4; 
    BOTTOM = 1;
    
    xvmin = 200;
    yvmin = 300;
    xvmax = 400;
    yvmax = 480;
 
    pointx = [xvmin xvmax  xvmax xvmax xvmin xvmax xvmin xvmin];
    pointy = [yvmin yvmin yvmin yvmax yvmax yvmax yvmax yvmin];
    hold on;
    plot(pointx, pointy,'r');
    
    code_p_1= find_code(p_1);
    code_p_2= find_code(p_2);
    while not(done)
        if bitand(code_p_1,code_p_2)    
        	done=1;
        elseif code_p_1==0 && code_p_2 ==0
            draw= 1;
            done=1;
        else
            p = struct('x',0,'y',0);
            if code_p_1 > 1
                intOut = code_p_1;
            else
                intOut = code_p_2;
            end
            
            if bitand(intOut,TOP)
                p.x= p_1.x + (p_2.x - p_1.x)*(ymax-p_1.y)/(p_2.y - p_1.y);
                p.y=ymax;
            
            elseif bitand(intOut,BOTTOM)
                p.x= p_1.x+(p_2.x - p_1.x)*(ymin- p_1.y)/(p_2.y - p_1.y);
                p.y=ymin;
           
            elseif bitand(intOut,RIGHT)
            	p.y = p_1.y + (p_2.y - p_1.y) * (xmax - p_1.x)/(p_2.x - p_1.x);    
                p.x=xmax;
            
            else
            	p.y = p_1.y + (p_2.y - p_1.y) * (xmin - p_1.x)/(p_2.x - p_1.x); 
                p.x=xmin;
            end

            if intOut == code_p_1
                p_1.x = p.x;
                p_1.y = p.y;
                code_p_1 = find_code(p_1);
            
            else
                p_2.x = p.x;
                p_2.y = p.y;
                code_p_2 = find_code(p_2);
            end
        end
    end
    
    
    if(draw)
	    scale_x=(xvmax-xvmin)/(xmax-xmin);
	    scale_y=(yvmax-yvmin)/(ymax-ymin);
	    vx0 = xvmin + (p_1.x - xmin) * scale_x;
	    vy0 = yvmin + (p_1.y - ymin) * scale_y;
	    vx1 = xvmin + (p_2.x - xmin) * scale_x;
	    vy1 = yvmin + (p_2.y - ymin) * scale_y;
        
        
       
        x_points = [vx0 vx1];
        y_points = [vy0 vy1];
        plot(x_points,y_points)
        hold on;
    end
end

