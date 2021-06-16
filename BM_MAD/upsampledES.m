I1 = imread('../../Insight Images/PNG/Sol 789/_mars.nasa.gov_insight-raw-images_surface_sol_0789_idc_D000M0789_666569938EDR_F0000_2696M_.png');
% % I2 = imread('../../Insight Images/PNG/Sol 789/_mars.nasa.gov_insight-raw-images_surface_sol_0789_idc_D000M0789_666569938EDR_F0000_2696M_.png');
% % I2 = imread('../../Insight Images/PNG/Sol 581/_mars.nasa.gov_insight-raw-images_surface_sol_0581_idc_D000M0581_648118580EDR_F0000_0675M_.png');
I2 = imread('../../Insight Images/PNG/Sol 789/_mars.nasa.gov_insight-raw-images_surface_sol_0789_idc_D000M0789_666569904EDR_F0000_2695M_.png');
% I1 = imread('../../Insight Images/PNG/Sol 581/_mars.nasa.gov_insight-raw-images_surface_sol_0581_idc_D000M0581_648118580EDR_F0000_0675M_.png');
% I2 = imread('../../Insight Images/PNG/Sol 581/_mars.nasa.gov_insight-raw-images_surface_sol_0581_idc_D000M0581_648118580EDR_F0000_0675M_.png');
I1 = rgb2gray(I1);
I2 = rgb2gray(I2);
[I1_up, I2_up] = Upsample(I1, I2);
% I1_up = imrotate(I1_up,0.026,'crop');
% figure
% subplot(1,2,1)
% imshow(I1_up)
% subplot(1,2,2)
% imshow(I2_up)
blockSize = 64;
searchSize = 2;
motionVectors = exhaustiveSearchBM(I1_up,I2_up,blockSize,searchSize);
save upsampledES.mat
