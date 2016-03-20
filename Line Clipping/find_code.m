function [ bit_code] = find_code( p )
    xmin=200;
    ymin=20;
    xmax=400;
    ymax=210;
    RIGHT =  8;
    LEFT  = 2;
    TOP  = 4; 
    BOTTOM = 1;
    bit_code = 0;
    if(p.y > ymax)   
    	bit_code = bitor(bit_code,TOP);
    end
    disp(bit_code)
    if(p.y < ymin)    
    	bit_code = bitor(bit_code,BOTTOM);
    end 
    disp(bit_code)
    if(p.x > xmax)   
    	bit_code = bitor(bit_code,RIGHT);
    end
    disp(bit_code)
    if(p.x < xmin)  
      bit_code = bitor(bit_code,LEFT);
    end
    disp(bit_code)
end

