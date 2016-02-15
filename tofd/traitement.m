clear all
close all
clc

%  275 frame pour 452 pt par frame
pt_par_frame = 452;
nb_frame = 275;


a= load('BSCAN1.csv');

b = zeros(275,452);
for x = 1:275
b(x,:) = a( ((x-1)*pt_par_frame +  1 :pt_par_frame + (x-1)*pt_par_frame));
end


exi
imagesc(b);
