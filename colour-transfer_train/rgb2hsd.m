function [ hsd ] = rgb2hsd( rgb )
%rgb color space transfer to hsd color space
%   input��rgb data array [m*n*3]
%   output :(Cx,Cy,D) in the hsd color space
rgb_shape = size(rgb);
l = rgb_shape(1);
c = rgb_shape(2);
k = rgb_shape(3);
    
hsd = zeros(l,c,k);

for pixelx = 1:l,
    for pixely = 1:c,
        B = rgb(pixelx,pixely,1);
        G = rgb(pixelx,pixely,2);
        R = rgb(pixelx,pixely,3);
        DB = - (log((B + 1) / 257.0));
        DG = - (log((G + 1) / 257.0));
        DR = - (log((R + 1) / 257.0));
        D = (DR + DB + DG)/3;
        Cx = DR / D -1;
        Cy = (DG - DB) / (D * sqrt(3));
        hsd(pixelx,pixely,1) = Cx;
        hsd(pixelx,pixely,2) = Cy;
        hsd(pixelx,pixely,3) = D;
    end
end
end