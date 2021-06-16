I1 = imread('../../../Insight Images/PNG/Sol 789/_mars.nasa.gov_insight-raw-images_surface_sol_0789_idc_D000M0789_666569938EDR_F0000_2696M_.png');
I2 = imread('../../../Insight Images/PNG/Sol 789/_mars.nasa.gov_insight-raw-images_surface_sol_0789_idc_D000M0789_666569904EDR_F0000_2695M_.png');
I1 = rgb2gray(I1);
I2 = rgb2gray(I2);
[I1_up, I2_fixed_up] = Upsample(I1, I2);
I1_up = I1_up(1450:2350,2200:4096);
I2_fixed_up = I2_fixed_up(1450:2350,2200:4096);

imDiff_actual = int8(I1_up) - int8(I2_fixed_up);
imDiff_actual_rescaled = rescale(imDiff_actual,-1,1);

figure
subplot(2,1,1)
imagesc(imDiff_actual_rescaled - 0.09);
colorbar
% Create colormap that is green for negative, red for positive,
% and a chunk inthe middle that is black.
greenColorMap = [zeros(1, 132), linspace(0, 1, 124)];
redColorMap = [linspace(1, 0, 124), zeros(1, 132)];
colorMap = [redColorMap; greenColorMap; zeros(1, 256)]';
caxis([-0.05 0.05]) % change colorbar limits
% Apply the colormap.
colormap(colorMap);
axis off

rotations = [0.4445 0.4446 0.4447 0.4448 0.4449 0.445 0.4451 0.4452 0.4453 0.4454 0.4455];
% y_scales = [0 1 2 3 4 5 6 7 8 9 10];
min_mse = realmax;
min_rotation = 0;
% min_scale = 0;
for rotation_index = 1:length(rotations)
%     for scales_index = 1:length(y_scales)
        I2_moving_up = imrotate(I2_fixed_up, rotations(rotation_index),'crop');
%         I2_moving_up = imresize(I2_moving_up, [(4096 + y_scales(scales_index)) 4096]);
        imDiff_estimate = int8(I2_moving_up) - int8(I2_fixed_up);
        imDiff_estimate_rescaled = rescale(imDiff_estimate,-1,1);
        mse = immse(imDiff_actual_rescaled, imDiff_estimate_rescaled);
        if(mse < min_mse)
            min_mse = mse;
            min_rotation = rotations(rotation_index);
%             min_scale = y_scales(scales_index);
        end
%     end
end

% output:
min_mse
min_rotation
% min_scale

I2_moving_up = imrotate(I2_fixed_up, min_rotation,'crop');
% I2_moving_up = imresize(I2_moving_up, [(4096 + min_scale) 4096]);
imDiff_estimate = int8(I2_moving_up) - int8(I2_fixed_up);
imDiff_estimate_rescaled = rescale(imDiff_estimate,-1,1);

subplot(2,1,2)
imagesc(imDiff_estimate_rescaled - 0.2);
colorbar
greenColorMap = [zeros(1, 132), linspace(0, 1, 124)];
redColorMap = [linspace(1, 0, 124), zeros(1, 132)];
colorMap = [redColorMap; greenColorMap; zeros(1, 256)]';
caxis([-0.05 0.05])
colormap(colorMap);
axis off



