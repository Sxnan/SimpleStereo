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
    scale = 0.125;
    

    path(1) = roots{1};
    path(1) = [char(path),'/disp0.pfm'];
    [img, scaleFactor] = parsePfm(path(1));

    img = imresize(img, scale,'nearest')/8;      
    img(isnan(img)) = 0;
    img(isinf(img)) = 0;
     imwrite((img+1)/max(max(img+1)), ['./','Motorcycle_GT.png' ]);
    
    %Get Different Dataset Path in imgs
folders = dir('result');
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
   for patch_size = 5:2:9
       path_res = [char(roots{1})];
       res_read = [char(sprintf("dp_%d.mat", patch_size))];
       res_name = char(sprintf("Comparison_Result_%d", patch_size));
       addpath(path_res);
       load(res_read);
       fprintf("Comparison_Result_motorcycle_dp_%d = %f\n",patch_size,rmse(img,disparity));
   end
   
      for patch_size = 5:2:9
       path_res = [char(roots{1})];
       res_read1 = [char(sprintf("ncc_%d.mat", patch_size))];
       res_read2 = [char(sprintf("ncc_%d_E.mat", patch_size))];
       res_read3 = [char(sprintf("ncc_%d_L.mat", patch_size))];
       res_name = char(sprintf("Comparison_Result_%d", patch_size));
       addpath(path_res);
       load(res_read1);
       fprintf("Comparison_Result_motorcycle_ncc_%d = %f\n",patch_size,rmse(img,disparity));
        load(res_read2);
       fprintf("Comparison_Result_motorcycle_ncc_%d_E = %f\n",patch_size,rmse(img,disparity));
        load(res_read3);
       fprintf("Comparison_Result_motorcycle_ncc_%d_L = %f\n",patch_size,rmse(img,disparity));
      end
      for patch_size = 5:2:9
       path_res = [char(roots{1})];
       res_read1 = [char(sprintf("corr_%d.mat", patch_size))];
       res_read2 = [char(sprintf("corr_%d_E.mat", patch_size))];
       res_read3 = [char(sprintf("corr_%d_L.mat", patch_size))];
       res_name = char(sprintf("Comparison_Result_%d", patch_size));
       addpath(path_res);
       load(res_read1);
       fprintf("Comparison_Result_motorcycle_corr_%d = %f\n",patch_size,rmse(img,disparity));
        load(res_read2);
       fprintf("Comparison_Result_motorcycle_corr_%d_E = %f\n",patch_size,rmse(img,disparity));
        load(res_read3);
       fprintf("Comparison_Result_motorcycle_corr_%d_L = %f\n",patch_size,rmse(img,disparity));
      end      
       for patch_size = 5:2:9
       path_res = [char(roots{1})];
       res_read1 = [char(sprintf("ssd_%d.mat", patch_size))];
       res_read2 = [char(sprintf("ssd_%d_E.mat", patch_size))];
       res_read3 = [char(sprintf("ssd_%d_L.mat", patch_size))];
       res_name = char(sprintf("Comparison_Result_%d", patch_size));
       addpath(path_res);
       load(res_read1);
       fprintf("Comparison_Result_motorcycle_ssd_%d = %f\n",patch_size,rmse(img,disparity));
        load(res_read2);
       fprintf("Comparison_Result_motorcycle_ssd_%d_E = %f\n",patch_size,rmse(img,disparity));
        load(res_read3);
       fprintf("Comparison_Result_motorcycle_ssd_%d_L = %f\n",patch_size,rmse(img,disparity));
      end       
      
      
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
    scale = 0.125;
    

    path(1) = roots{2};
    path(1) = [char(path),'/disp0.pfm'];
    [img, scaleFactor] = parsePfm(path(1));

    img = imresize(img, scale,'nearest')/8;      
    img(isnan(img)) = -1;
    img(isinf(img)) = -1;
    imwrite((img+1)/max(max(img+1)), ['./','Umbrella_GT.png' ]);
    
    %Get Different Dataset Path in imgs
folders = dir('result');
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
   for patch_size = 5:2:9
       path_res = [char(roots{2})];
       res_read = [char(sprintf("dp_%d.mat", patch_size))];
       res_name = char(sprintf("Comparison_Result_%d", patch_size));
       addpath(path_res);
       load(res_read);
       fprintf("Comparison_Result_umbrella_dp_%d = %f\n",patch_size,rmse(img,disparity));
   end
   
      for patch_size = 5:2:9
       path_res = [char(roots{2})];
       res_read1 = [char(sprintf("ncc_%d.mat", patch_size))];
       res_read2 = [char(sprintf("ncc_%d_E.mat", patch_size))];
       res_read3 = [char(sprintf("ncc_%d_L.mat", patch_size))];
       res_name = char(sprintf("Comparison_Result_%d", patch_size));
       addpath(path_res);
       load(res_read1);
       fprintf("Comparison_Result_umbrella_ncc_%d = %f\n",patch_size,rmse(img,disparity));
        load(res_read2);
       fprintf("Comparison_Result_umbrella_ncc_%d_E = %f\n",patch_size,rmse(img,disparity));
        load(res_read3);
       fprintf("Comparison_Result_umbrella_ncc_%d_L = %f\n",patch_size,rmse(img,disparity));
      end
      for patch_size = 5:2:9
       path_res = [char(roots{2})];
       res_read1 = [char(sprintf("corr_%d.mat", patch_size))];
       res_read2 = [char(sprintf("corr_%d_E.mat", patch_size))];
       res_read3 = [char(sprintf("corr_%d_L.mat", patch_size))];
       res_name = char(sprintf("Comparison_Result_%d", patch_size));
       addpath(path_res);
       load(res_read1);
       fprintf("Comparison_Result_umbrella_corr_%d = %f\n",patch_size,rmse(img,disparity));
        load(res_read2);
       fprintf("Comparison_Result_umbrella_corr_%d_E = %f\n",patch_size,rmse(img,disparity));
        load(res_read3);
       fprintf("Comparison_Result_umbrella_corr_%d_L = %f\n",patch_size,rmse(img,disparity));
      end      
       for patch_size = 5:2:9
       path_res = [char(roots{2})];
       res_read1 = [char(sprintf("ssd_%d.mat", patch_size))];
       res_read2 = [char(sprintf("ssd_%d_E.mat", patch_size))];
       res_read3 = [char(sprintf("ssd_%d_L.mat", patch_size))];
       res_name = char(sprintf("Comparison_Result_%d", patch_size));
       addpath(path_res);
       load(res_read1);
       fprintf("Comparison_Result_umbrella_ssd_%d = %f\n",patch_size,rmse(img,disparity));
        load(res_read2);
       fprintf("Comparison_Result_umbrella_ssd_%d_E = %f\n",patch_size,rmse(img,disparity));
        load(res_read3);
       fprintf("Comparison_Result_umbrella_ssd_%d_L = %f\n",patch_size,rmse(img,disparity));
      end       