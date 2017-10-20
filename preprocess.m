function [im0, im1, max_disp] = preprocess(path, max_disparity, scale)
    % Load the left and right images from path and scale down
    % path - path to the data folder e.g imgs/motorcycle
    %        The left image should named im0.png
    %        The right image should be named im1.png
    %
    % max_disparty - The max disparity the imgs execpted to have
    %         
    % scale - default 1, scale the image
    
    if ~exist(path, 'dir')
        fprintf('%s does not exist', path);
    end
    
    left_img_path = [path, '/im0.png'];
    right_img_path = [path, '/im1.png'];
    
    im0 = imread(left_img_path);
    im1 = imread(right_img_path);
    
    im0 = rgb2gray(im0);
    im0 = imresize(im0, scale);
    
    im1 = rgb2gray(im1);
    im1 = imresize(im1, scale);
    
    max_disp = ceil(max_disparity * scale);
end