function [ bit_code ] = find_code( p , i)
    bit_code =0;
    xmin=200;
    ymin=20;
    xmax=400;
    ymax=210;
    RIGHT =  2;
    LEFT  = 8;
    TOP  = 1; 
    BOTTOM = 4;

    if (p.y < ymax && i== 0)   
        bit_code = bitor(bit_code,TOP);
    end
    if (p.y > ymin && i== 2)    
        bit_code = bitor(bit_code,BOTTOM);
    end
    if (p.x < xmax && i== 1)   
        bit_code = bitor(bit_code,RIGHT);
    end
    if (p.x > xmin && i==3)  
      bit_code =  bitor(bit_code,LEFT);
    end
end

