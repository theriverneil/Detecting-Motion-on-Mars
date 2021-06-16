% I1 = imread('../../Insight Images/PNG/Sol 789/_mars.nasa.gov_insight-raw-images_surface_sol_0789_idc_D000M0789_666569904EDR_F0000_2695M_.png');
% I2 = imread('../../Insight Images/PNG/Sol 789/_mars.nasa.gov_insight-raw-images_surface_sol_0789_idc_D000M0789_666569904EDR_F0000_2695M_.png');
% I1 = imread('../../Insight Images/PNG/Sol 581/_mars.nasa.gov_insight-raw-images_surface_sol_0581_idc_D000M0581_648125177EDR_F0000_0677M_.png');
% I2 = imread('../../Insight Images/PNG/Sol 581/_mars.nasa.gov_insight-raw-images_surface_sol_0581_idc_D000M0581_648118580EDR_F0000_0675M_.png');
% I1 = imread('../../Insight Images/PNG/Sol 74/_mars.nasa.gov_insight-raw-images_surface_sol_0074_idc_D000M0074_603100529EDR_F0000_2697M_.png');
% I2 = imread('../../Insight Images/PNG/Sol 74/_mars.nasa.gov_insight-raw-images_surface_sol_0074_idc_D000M0074_603100242EDR_F0000_0116M_.png');
% I1 = imread('../../Insight Images/PNG/Sol 99/_mars.nasa.gov_insight-raw-images_surface_sol_0099_idc_D000M0099_605331546EDR_F0000_2709M_.png');
% I2 = imread('../../Insight Images/PNG/Sol 99/_mars.nasa.gov_insight-raw-images_surface_sol_0099_idc_D000M0099_605330988EDR_F0000_2697M_.png');
% I1 = imread('../../Insight Images/PNG/Sol 96/_mars.nasa.gov_insight-raw-images_surface_sol_0096_idc_D000M0096_605054809EDR_F0000_2705M_.png');
% I2 = imread('../../Insight Images/PNG/Sol 96/_mars.nasa.gov_insight-raw-images_surface_sol_0096_idc_D000M0096_605054484EDR_F0000_2698M_.png');
% I1 = imread('../../Insight Images/PNG/Sol 97/_mars.nasa.gov_insight-raw-images_surface_sol_0097_idc_D000M0097_605136927EDR_F0000_2709M_.png');
% I2 = imread('../../Insight Images/PNG/Sol 97/_mars.nasa.gov_insight-raw-images_surface_sol_0097_idc_D000M0097_605136369EDR_F0000_2697M_.png');
I1 = rgb2gray(I1);
I2 = rgb2gray(I2);
[I1_up, I2_up] = Upsample(I1, I2);
% I1_up = imtranslate(I1_up,[0, -90]);
% I1_up = imrotate(I1_up(1450:2350,2200:4096), 5, 'crop');
% figure
% % subplot(1,2,1)
% imshow(I1_up(2500:3860,1:800))
% % subplot(1,2,2)
% figure
% imshow(I2_up(2500:3860,1:800))
imDiff = int8(I1_up(1600:3200,1:1150)) - int8(I2_up(1600:3200,1:1150));
imDiff = rescale(imDiff,-1,1);
figure
imagesc(imDiff - 0.082);
colorbar
greenColorMap = [zeros(1, 132), linspace(0, 1, 124)];
redColorMap = [linspace(1, 0, 124), zeros(1, 132)];
colorMap = [redColorMap; greenColorMap; zeros(1, 256)]';
caxis([-0.05 0.05])
colormap(colorMap);
axis off