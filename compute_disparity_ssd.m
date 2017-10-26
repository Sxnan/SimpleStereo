function disparity = compute_disparity_ssd(l_img, r_img, max_disp, patch_size, threshold)
    offset = fix(patch_size / 2);
    [img_row, img_col] = size(l_img);
    disparity = zeros(img_row, img_col) - 1;
    for i=(offset+1):(img_row - offset)
        for j=(offset+1):(img_col - offset)
            l_patch = double(l_img((i-offset):(i+offset), (j-offset):(j+offset)));
            if std(l_patch(:)) ~= 0
                r_candidate = get_candidate(i, j, patch_size, r_img, max_disp);
                scores = ssd_matching(l_patch, r_candidate);
                scores = fliplr(scores);
                [min_score, disp] = min(scores);
                disp = disp - 1;
                if min_score > threshold
                    disp = -1;
                end
            else
                disp = -1;
            end
            disparity(i, j) = disp;
        end
    end
end
