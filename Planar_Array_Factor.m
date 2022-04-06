%% 2D Array factor of planar array with MxN elements
clc
clear 
%Set operating frequency as f
f = 32*10^9;
c = 3*10^8;
lamda =1000*(c/f);
k = 2*pi/lamda;



%Set unit cell size(grid) as lamda/2
unit_cell = 4.7;  
resolution = 100/ceil(unit_cell);

dx=lamda/2;             %interelemnt spacing across x
dy = lamda/2;           %interelemnt spacing across y
theta_m =deg2rad(0);   %main lobe direction for elevation
phi_m =deg2rad(25);     %main lobe direction for azimuth
bx=-k*dx*sin(theta_m)*cos(phi_m); % progressive phase shift across x
by=-k*dy*sin(theta_m)*sin(phi_m); % progressive phase shift across y
M=resolution;            % number of elemnts across x
N=resolution;            % number of elemnts across y

theta=deg2rad(-90:0.0001:90);
phi=deg2rad(25);
AFx = sin((M.*(k*dx.*sin(theta).*cos(phi)+bx))./2)./(M.*sin((k*dx.*sin(theta).*cos(phi)+bx)/2));
AFy = sin((N.*(k*dy.*sin(theta).*cos(phi)+by))./2)./(N.*sin((k*dy.*sin(theta).*cos(phi)+by)/2));
AF_total=AFx.*AFy;

plot(rad2deg(theta),AFx)
hold on
plot(rad2deg(theta),AFy)
hold on
plot(rad2deg(theta),AF_total)
legend("AFx","AFy","AF_total")
grid on




%% 3D Array factor of planar array with MxN elements
clc
clear all
%Set operating frequency as f
f = 32*10^9;
c = 3*10^8;
lamda =1000*(c/f);
k = 2*pi/lamda;



%Set unit cell size(grid) as lamda/2
unit_cell = 4.7;  
resolution = 25/ceil(unit_cell);

dx=lamda/2;             %interelemnt spacing across x
dy = lamda/2;           %interelemnt spacing across y
theta_m =deg2rad(0);   %main lobe direction for elevation
phi_m =deg2rad(0);     %main lobe direction for azimuth
bx=-k*dx*sin(theta_m)*cos(phi_m); % progressive phase shift across x
by=-k*dy*sin(theta_m)*sin(phi_m); % progressive phase shift across y
M=resolution; % number of elemnts across x
N=resolution;  % number of elemnts across y

for theta=-90:90
    for phi = -180:180
AFx(theta+91,phi+181) = sin((M.*(k*dx.*sin(theta+91).*cos(phi+181)+bx))./2)./(M.*sin((k*dx.*sin(theta+91).*cos(phi+181)+bx)./2));
AFy(theta+91,phi+181) = sin((N.*(k*dy.*sin(theta+91).*cos(phi+181)+by))./2)./(N.*sin((k*dy.*sin(theta+91).*cos(phi+181)+by)./2));
    end
end
AF_total=AFx.*AFy;

plot(-90:90,AF_total(:,91))
% patternCustom(AF_total',1:1:181 ,-180:1:180);