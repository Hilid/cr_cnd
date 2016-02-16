clear all
close all
clc

fv = 50e2:1000:300e2	;

VL = 6450;
VT = 3100;
h = 5.56*10^-3; 

theta = 10*360/2/pi;%angle d'incidence
kxv = sin(theta)*2*pi*fv/343;   % composante en x du vecteur d'onde de l'onde incidente


[kx, f]= meshgrid(kxv, fv);
w = 2*pi*f;

kL = w*f/VL;
kT = w*f/VT;
kx = sin(theta)*2*pi*f/343;

% projetés en z
kzL = sqrt(kL.^2 - kx.^2);
kzT = sqrt(kT.^2 - kx.^2);

d = .5*h;
% plan de trace
sym = 4.*kx.^2.*kzL.*kzT.*cos(kzL*d).*sin(kzT*d)+(2*kx.^2-kT.^2).^2.*cos(kzT*d).*sin(kzL*d);
antisym = 4.*kx.^2.*kzL.*kzT.*sin(kzL*d).*cos(kzT*d)+(2*kx.^2-kT.^2).^2.*sin(kzT*d).*cos(kzL*d);


sym = real(sym) + imag(sym);
antisym = real(antisym) + imag(antisym);

isoline = [0 0];

% figure : plan fh,vphi
figure;

vphi = w./kx;
contour(f*h, vphi, sym, isoline, 'b', 'LineWidth', 2);
hold on;
contour(f*h, vphi, antisym, isoline, 'r', 'LineWidth', 2);

% legend('Sym', 'AntiSym', 'location', 'southeast')

xlabel('f.h');
ylabel('v_\Phi (mm/µs)');
axis('square');


