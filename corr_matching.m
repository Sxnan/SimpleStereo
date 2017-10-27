function score = corr_matching(im1,im2)
    getRowSize = size(im1,1);
    getColSize = size(im1,2);
    totalSize = getRowSize*getColSize; 
    mean = sum(sum(im1)) /  totalSize;
    im1New = im1 - mean;
    raw = xcorr2(im2, im1New);
    need = fix(size(raw,1)/2)+1;
    score = raw(need, getColSize: end - getColSize +1);  
end