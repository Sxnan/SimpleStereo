function [im0, im1, max_disp] = preprocess(path, max_disparity, scale, left_img, right_img)
    % Load the left and right images from path and scale down
    % path - path to the data folder e.g imgs/motorcycle
    %        The left image should named im0.png
    %        The right image should be named im1.png
    %
    % max_disparty - The max disparity the imgs execpted to have
    %         
    % scale - default 1, scale the image
    
    if ~exist('left_img', 'var')
        left_img = '/im0.png';
    end
    if ~exist('right_img', 'var')
        right_img = '/im1.png';
    end
    
    
    if ~exist(path, 'dir')
        fprintf('%s does not exist', path);
    end
    
    left_img_path = [path, left_img];
    right_img_path = [path, right_img];
    
    im0 = imread(left_img_path);
    im1 = imread(right_img_path);
    
    im0 = rgb2gray(im0);
    im0 = imresize(im0, scale);
    
    im1 = rgb2gray(im1);
    im1 = imresize(im1, scale);
    
    max_disp = ceil(max_disparity * scale);
end