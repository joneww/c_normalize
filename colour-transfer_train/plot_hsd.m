function plot_hsd(I0,I1,I2)
Cx = I0(:,:,1);
Cy = I0(:,:,2);

Cx_t = I1(:,:,1);
Cy_t = I1(:,:,2);

Cx_mk = I2(:,:,1);
Cy_mk = I2(:,:,2);

screensize = get(0,'ScreenSize');
sz = [576, 1024];
figure('Position', [ ceil((screensize(3)-sz(2))/2), ceil((screensize(4)-sz(1))/2), sz(2), sz(1)]);
subplot('Position',[0.01  0.4850 0.3200 .47]);
plot(Cx,Cy,'.r',Cx_t,Cy_t,'.g',Cx_mk,Cy_mk,'.b')

subplot('Position',[0.3400  0.4850 0.3200 .47]);
plot(Cx,Cy,'.r')
subplot('Position',[0.01 0.01 0.3200 .47]);
plot(Cx_t,Cy_t,'.g')
subplot('Position',[0.3400 0.01 0.3200 .47]);
plot(Cx_mk,Cy_mk,'.b')
end
