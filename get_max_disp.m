function max_disp = get_max_disp(path)
    if ~exist(path, "dir")
        fprintf("%s does not exist\n", path);
    end
    
    file = path + "/calib.txt";
    
    if ~exist(file, "file")
        fprintf("%s does not exist\n", file);
    end
    
    fd = fopen(file);
    
    A = textscan(fd, "%s", "Delimiter", "\n");
    s = A{1}{7};
    max_disp = textscan(s, "%s", "Delimiter", "=");
    max_disp = str2double(max_disp{1}{2});
    fclose(fd);
    
end