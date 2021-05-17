function [Z,n] = load_surfacefile(file)
    data = load(file);
    Length = length(data);
    Width = numel(data)/Length;
    %data=textread(file, '%f');
    
    if Width == 1
        t = length(data);
        n = sqrt(t);
    
        for i = 1:n
            for j = 1:n
                Z(i,j) = data((i-1)*n+j);
            end
        end
    else
        Z = data;
        n = Length;
    end
end

