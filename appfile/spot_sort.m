function [max_num]  =  spot_sort(All_B, z_data)

max_z    =  max(max(z_data));

[Ny,Nx]  =  size(z_data);
[Nn,No]  =  size(All_B);

summitx(1:Nn)  =  imag(All_B(1:Nn));
summity(1:Nn)  =  real(All_B(1:Nn));

max_num      =  [];
point        =  0;
point_used_B =  0;

for  ii=1:Nn
    if  z_data(summity(ii),summitx(ii)) == max_z
        z_data(summity(ii),summitx(ii)) = z_data(summity(ii),summitx(ii)) - 0.1;
        
        point  =  point  +  1;
        max_num(point) =  1;
        
        Nei_B  =  All_B(ii);
        dec    =  1;
        
        while dec
            [Nei_B  Core_B  dec  z_data] =  spot_neibor_group(Nei_B, z_data, max_z);
        end
        
        max_num(point) =  max(size(Core_B));
        
    end
end

max_num  =  max_num';
                        
                        