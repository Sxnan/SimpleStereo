function scores = my_ncc_matching(template, candidate)
    template_width = size(template, 1);
    offset = fix(template_width/2);
    candidate_width = size(candidate, 2);
    scores = zeros(1, candidate_width-template_width+1);
    for i=(1+offset):(size(candidate,2)-offset)
        template_n = normalize(template);
        candidate_n = normalize(candidate(:,i-offset:i+offset));
        scores(1,i-offset)=sum(sum(template_n .* candidate_n));
    end
end


function out_mat = normalize(in_mat)
    mat_mean = mean(mean(in_mat));
    n = double(in_mat) - mat_mean;
    m = sqrt(sum(sum(n.^2)));
    out_mat = n ./ m;
end