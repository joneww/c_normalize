function [ rgb ] = hsd2rgb( hsd )
%hsd color space transfer to rgb color space
%   input£º(Cx,Cy,D) in the hsd color space
%   output :rgb data array [m*n*3]
hsd_shape = size(hsd);
l = hsd_shape(1);
c = hsd_shape(2);
k = hsd_shape(3);
    
rgb = zeros(l,c,k);

for pixelx = 1:l,
    for pixely = 1:c,
        Cx = hsd(pixelx,pixely,1);
        Cy = hsd(pixelx,pixely,2);
        D = hsd(pixelx,pixely,3);
        Dr = (Cx+1)*D;
        Dg = ((Cy*D*sqrt(3)) + (3*D-Dr))/2; 
        Db = 3*D - Dr - Dg;
        b = exp(-Db)*257-1;
        g = exp(-Dg)*257-1;
        r = exp(-Dr)*257-1;
 
        rgb(pixelx,pixely,1) = b;
        rgb(pixelx,pixely,2) = g;
        rgb(pixelx,pixely,3) = r;
    end
end
end

