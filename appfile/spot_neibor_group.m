function [temp Core_B point z_data] =  spot_neibor_group(Nei_B, z_data, max_z)

Core_B  = Nei_B;
[Ny Nx] = size(z_data);

for REAL = -1 : 1
    for IMAG = -1 : 1
        Nei_New  = Core_B + REAL + 1i*IMAG;
        Nei_B    = union( Nei_B , Nei_New );
    end
end

Nei_B   = setdiff( Nei_B , Core_B );
Nei_B(find(real(Nei_B)<   1)) =[];
Nei_B(find(imag(Nei_B)<   1)) =[];
Nei_B(find(real(Nei_B)>Ny)) =[];
Nei_B(find(imag(Nei_B)>Nx)) =[];

dec   = ~isempty(Nei_B);
point = 0;

if dec
    summitx  =  imag(Nei_B);
    summity  =  real(Nei_B);
    for ii = 1 : max(size(summitx))
        if z_data(summity(ii),summitx(ii)) == max_z
            z_data(summity(ii),summitx(ii)) = z_data(summity(ii),summitx(ii)) - 0.1;
            point = point + 1;
            temp(point) = Nei_B(ii);
        end
    end
end

if point == 0
    temp = 1;
end


