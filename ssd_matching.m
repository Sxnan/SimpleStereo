function result = ssd_matching(im1,im2)
   getRowSize = size(im1,1);
   getColSize = size(im1,2);
   getColSize2 = size(im2, 2);
   temp = zeros(1,getColSize2 - getColSize + 1);
   range = 1;
   max = getColSize2;
   count = 1;
   while (range + getColSize - 1 <= max)
           g = double(im2(1:getRowSize, range:range+getColSize - 1));
           fmg = im1 - g;
           fmgsquare = fmg.*fmg;
           sum_temp = sum(sum(fmgsquare));
           temp(1,count) = sum_temp;
           count = count + 1;
           range = range + 1;
   end
   result = temp;
end