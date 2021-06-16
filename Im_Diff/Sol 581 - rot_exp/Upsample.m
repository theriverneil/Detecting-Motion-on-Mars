function [I1, I2] = Upsample(Im1, Im2)    
%     [x y] = meshgrid(1:1024);
%     [xi yi] = meshgrid(1:0.25:1024);
%     
%     I1 = uint8(interp2(x,y,double(Im1),xi,yi,'linear'));
%     
%     I2 = uint8(interp2(x,y,double(Im2),xi,yi,'linear'));
    I1 = imresize(Im1, 4);
    I2 = imresize(Im2, 4);
end