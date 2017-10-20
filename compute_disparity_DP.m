function disparitys = compute_disparity_DP(l_img, r_img, patch_size)
    offset = fix(patch_size/2);
    [m, n] = size(l_img);
    disparitys = zeros(m, n) - 1;
    for i=1+offset:m-offset
        dsi = get_dsi(l_img, r_img, i, patch_size);
        [M, optimum] = get_optimum(dsi, 0.5);
        row_disparity = get_row_disparity(optimum, M, dsi, 0.5);
        disparitys(i, 1+offset:n-offset) = row_disparity;
        fprintf("i=%d\n", i);
    end
end

function dsi = get_dsi(l_img, r_img, n, patch_size)
    %Compute the Disparity Space Image at row i
    %The dissimilarity values are computed by (1-NCC)
    offset = fix(patch_size / 2);
    
    % width of the img
    M = size(l_img, 2);
    
    
    dsi = zeros(M - 2 * offset);
    
    for i=1+offset:M-offset
        patch = double(l_img(n-offset:n+offset, i-offset:i+offset));
        
        %Check if the patch is flat
        if std(patch(:)) == 0
            dsi(:, i-offset) = zeros(size(dsi, 1), 1) + 2;
        else
            candidate = r_img(n-offset:n+offset,:);
            ncc_scores = ncc_matching(patch, candidate);
            dsi(:, i-offset) = 1-ncc_scores;
        end
    end
end

function [M, optimum] = get_optimum(dsi, occlusion_cost)
    [m, n] = size(dsi);
    M = zeros(size(dsi));
    
    %Initialize M the dynamic programming matrix
    %Where M(i, j) is the minimum cost from dsi(1,1) to dsi(i, j)
    M(1, 1) = min(dsi(1,1), occlusion_cost);
    for i=2:n
        M(1, i) = M(1, i-1) + occlusion_cost;
    end
    for j=2:m
        M(j, 1) = M(j-1, 1) + occlusion_cost;
    end
    
    
    %Computing the matrix
    for i=2:m
        for j=2:n
            M(i,j) = min([M(i-1, j-1) + dsi(i, j), M(i-1, j) + occlusion_cost, M(i, j-1) + occlusion_cost]);
        end
    end
    
    optimum = M(m, n);
    
end

function row_disps = get_row_disparity(optimum, M, dsi, occlusion_cost)
    row_disps = zeros(1, size(M, 2));
    [i, j] = size(M);
    while (i >= 2 && j >= 2)
        if (abs(optimum-dsi(i, j)-M(i-1, j-1))<1e-5) % i match j
            row_disps(1, j)=j-i;
            i = i-1; j = j-1; optimum = M(i, j);
        elseif (abs(optimum-occlusion_cost-M(i-1, j))<1e-5) % unmatched
            row_disps(1, j)=-1;
            i = i-1; optimum = M(i, j);
        elseif (abs(optimum-occlusion_cost-M(i, j-1))<1e-5) % unmatched
            row_disps(1, j)=-1;
            j = j-1; optimum = M(i, j);
        else
            fprintf("Something wrong\n")
        end
    end
    for m=1:j
        row_disps(1, m) = -1;
    end
end