function scores = ncc_matching(template, candidate)
    template_col = size(template, 2);
    scores = normxcorr2(template, candidate);
    j = fix(size(scores, 1)/2)+1;
    scores = scores(j,template_col:end-template_col+1);
end

