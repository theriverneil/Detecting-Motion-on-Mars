I1 = imread('../../Insight Images/PNG/Sol 74/_mars.nasa.gov_insight-raw-images_surface_sol_0074_idc_D000M0074_603100242EDR_F0000_0116M_.png');
I1 = rgb2gray(I1);
[I1,~] = Upsample(I1,I1);
figure
subplot(1,2,1)
imshow(I1)
subplot(1,2,2)
imshow(I1(2500:3860,1:800))
I1 = imread(sprintf('../../Insight Images/PNG/Sol 96/%s.png', "_mars.nasa.gov_insight-raw-images_surface_sol_0096_idc_D000M0096_605054344EDR_F0000_2695M_"));
I1 = rgb2gray(I1);
[I1,~] = Upsample(I1,I1);
figure
subplot(1,2,1)
imshow(I1)
subplot(1,2,2)
imshow(I1(1600:3200,1:1150))
I1 = imread('../../Insight Images/PNG/Sol 97/_mars.nasa.gov_insight-raw-images_surface_sol_0097_idc_D000M0097_605136276EDR_F0000_2695M_.png');
I1 = rgb2gray(I1);
[I1,~] = Upsample(I1,I1);
figure
subplot(1,2,1)
imshow(I1)
subplot(1,2,2)
imshow(I1(1600:3200,1:1150))
I1 = imread('../../Insight Images/PNG/Sol 99/_mars.nasa.gov_insight-raw-images_surface_sol_0099_idc_D000M0099_605330896EDR_F0000_2695M_.png');
I1 = rgb2gray(I1);
[I1,~] = Upsample(I1,I1);
figure
subplot(1,2,1)
imshow(I1)
subplot(1,2,2)
imshow(I1(1600:3200,1:1150))
I1 = imread('../../Insight Images/PNG/Sol 581/_mars.nasa.gov_insight-raw-images_surface_sol_0581_idc_D000M0581_648118580EDR_F0000_0675M_.png');
I1 = rgb2gray(I1);
[I1,~] = Upsample(I1,I1);
figure
subplot(1,2,1)
imshow(I1)
subplot(1,2,2)
imshow(I1(1430:2380,1790:3480))

