I1 = imread('../../Insight Images/PNG/Sol 789/_mars.nasa.gov_insight-raw-images_surface_sol_0789_idc_D000M0789_666569938EDR_F0000_2696M_.png');
I2 = imread('../../Insight Images/PNG/Sol 789/_mars.nasa.gov_insight-raw-images_surface_sol_0789_idc_D000M0789_666569904EDR_F0000_2695M_.png');
I1 = rgb2gray(I1);
I2 = rgb2gray(I2);
[I1_up, I2_fixed_up] = Upsample(I1, I2);

imDiff_actual = int8(I1_up) - int8(I2_fixed_up);

I2_moving_up = imrotate(I2_fixed_up, 0.03);
I2_moving_up = imresize(I2_moving_up, [4101 4096]);
figure
imshow(I1_up(1400:2400,150:4096))
figure
imshow(I2_moving_up(1400:2400,150:4096))
% imDiff_estimate = int8(I2_moving_up(1400:2400,:)) - int8(I2_fixed_up(1400:2400,:));
% 
% figure
% imshow(imDiff_actual(1400:2400,:))
% figure
% imshow(imDiff_estimate)