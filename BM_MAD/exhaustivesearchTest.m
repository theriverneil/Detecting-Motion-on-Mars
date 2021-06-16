I1 = imread('../../Insight Images/PNG/Sol 581/_mars.nasa.gov_insight-raw-images_surface_sol_0581_idc_D000M0581_648118580EDR_F0000_0675M_.png');
I2 = imread('../../Insight Images/PNG/Sol 581/_mars.nasa.gov_insight-raw-images_surface_sol_0581_idc_D000M0581_648118580EDR_F0000_0675M_.png');
I1 = rgb2gray(I1);
I2 = rgb2gray(I2);
% figure
% imshow(I1)
% figure
% imshow(I2)
blockSize = 16;
searchSize = 7;
motionVectors = exhaustiveSearchBM(I1,I2,blockSize,searchSize);
% map = dispMap(motionVect, I2, mbSize);
% figure
% imshow(map)
save exhaustivesearchTest.mat