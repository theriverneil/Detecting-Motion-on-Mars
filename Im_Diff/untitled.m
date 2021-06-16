I = imread('_mars.nasa.gov_insight-raw-images_surface_sol_0870_idc_D000M0870_673756595EDR_F0000_0900M_.png');
I = rgb2gray(I);
[I,~] = Upsample(I, I);
I = I(3196:4096,1:1897)

imshow(I)
