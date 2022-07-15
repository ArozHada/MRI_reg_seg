%% Calculate TRE 
function [msd_avg, msd_std] = calcTRE(fixed_landmarks,mov_landmarks,voxel_dimensions)

%initialization
num_features = length(fixed_landmarks);

%computing the distance in mm between correspondnig features and matches
%using the voxel spacing provided
difference = fixed_landmarks - mov_landmarks;
pixel2mm = repmat([voxel_dimensions(1), voxel_dimensions(2), voxel_dimensions(3)], num_features,1);
ssd = sqrt(sum((difference.* pixel2mm).^2,2));

%Average and standard deviation for the distances
msd_avg = mean(ssd);
msd_std = std(ssd);

end