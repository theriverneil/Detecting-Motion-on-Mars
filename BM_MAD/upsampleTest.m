I1 = imread('../../Insight Images/PNG/Sol 581/_mars.nasa.gov_insight-raw-images_surface_sol_0581_idc_D000M0581_648118580EDR_F0000_0675M_.png');
I2 = imread('../../Insight Images/PNG/Sol 581/_mars.nasa.gov_insight-raw-images_surface_sol_0581_idc_D000M0581_648122311EDR_F0000_0676M_.png');
I1 = rgb2gray(I1);
I2 = rgb2gray(I2);
figure
imshow(I1)
figure
imshow(I2)
[I1_up, I2_up] = Upsample(I1, I2);
figure
imshow(I1_up)
figure
imshow(I2_up)