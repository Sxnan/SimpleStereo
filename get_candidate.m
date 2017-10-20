function candidate = get_candidate(i, j, patch_size, r_img, max_disp)
    %Get the candidate from the right image base on the max disparity
    offset = fix(patch_size / 2);
    j_min = max(1, j-max_disp-offset);
    candidate = r_img((i-offset):(i+offset), j_min:j+offset);
end