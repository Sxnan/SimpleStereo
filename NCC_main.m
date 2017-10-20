%Get Different Dataset Path in imgs
folders = dir('imgs');
roots = cell(size(folders, 1) - 2, 1);
img_names = cell(size(folders, 1) - 2, 1);
idx = 1;
for i=1:size(folders, 1)
    if (folders(i).name ~= ".." && folders(i).name ~= ".")
        roots{idx} = folders(i).folder + "/" + folders(i).name;
        img_names{idx} = folders(i).name;
        idx = idx + 1;
    end
end

max_disps = zeros(size(roots, 1), 1);

%Get Max Disparity for each data set
for i=1:size(roots, 1)
    max_disps(i) = get_max_disp(roots{i});
end

%Make result folder if not exist
if ~exist('result', 'dir')
    mkdir('result');
end

%Setting Parameter
scale = 0.1;
threshold_ncc = 0.5;

%Compute disparity for each dataset
for i=1:size(roots, 1)
    path = roots{i};
    max_disparity = max_disps(i);
    
    %Make result folder for the dataset if not exist
    result_folder = char("result/" + img_names{i});
    if ~exist(result_folder, "dir")
        mkdir(result_folder);
    end
    
    [im0, im1, max_disp] = preprocess(char(path), max_disparity, scale);
    fprintf("Compute on %s\n", path);
    %Loop through different patch size
    for patch_size = 5:2:9
        fprintf("Patch size: %d\n", patch_size);
        tic
        disparity = compute_disparity(im0, im1, max_disp, patch_size, threshold_ncc, @ncc_matching);
        image_res_name = char(sprintf("ncc_%d.png", patch_size));
        res_name = char(sprintf("ncc_%d.mat", patch_size));
        toc;
        
        save([result_folder, '/', res_name], 'disparity');
        fprintf("Result saved at %s\n", [result_folder, '/', res_name]);
        
        imwrite((disparity+1)/max(max(disparity+1)), [result_folder, '/', image_res_name]);
        fprintf("Result image saved at %s\n", [result_folder, '/', image_res_name]);
        
        fprintf("---------------------------------------------------------\n")
    end
end
