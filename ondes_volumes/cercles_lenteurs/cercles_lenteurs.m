clear all; close all;

d=20.5e-3; %epaisseur de la plaque
theta_i=([10 30 40 50 60])*(pi/180); %angles d'incidence dans le plexi en rad
dt_T=[35.2 34.5 33.9 31.9 31.6]*10^(-6); %temps de parcours total mesures

%info plexi
e=38*10^-3; %epaisseur du sabot
v_plexi=2730; %m/s : vitesse dans le plexi
dl_plexi=2*e; %distances de parcours dans le plexi
dt_plexi=dl_plexi/v_plexi; %temps de parcours dans le plexi


%info alu
dt_T_alu=dt_T-dt_plexi; %temps de vol dans l'alu

for n=1:5
	if 2*d.*sin(theta_i(n))./(dt_T_alu(n)*v_plexi)<1
		theta_T_alu = 0.5.*asin(2*d.*sin(theta_i)./(dt_T_alu*v_plexi));  %angles transmis T en rad
	elseif  2*d.*sin(theta_i(n))./(dt_T_alu(n)*v_plexi)>1
		theta_T_alu = -0.5.*asin(2*d.*sin(theta_i)./(dt_T_alu*v_plexi)-1)
	end
end
v_alu=sin(theta_T_alu)*v_plexi./sin(theta_i);
 
polar(theta_i,1/v_plexi*ones(1,5), '-o');
hold on
polar(linspace(0,pi,100), ones(1,100)*max(1/v_plexi),'--');
hold on
polar(-theta_T_alu,1./(v_alu),'o-');
hold on
polar(-linspace(0,pi,100), ones(1,100)*max(1/3000),'--');

%cercle theorique
c_T_alu_theo=3000;
theta_T_theo=c_T_alu_theo*sin(theta_i)/v_plexi;
dl_alu_theo=d./cos(theta_T_theo);
dt_alu_theo=dl_alu_theo./c_T_alu_theo;

