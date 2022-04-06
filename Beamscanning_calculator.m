%% Phase profile calculation for reflectarray with feed positioned at (x,y,z) = (0,0,R0)
clc
clear

%Load the reflection phase profile data of the unitcell from HFSS
load ReflectionPhaseTE00.mat

%Set operating frequency as f
f = 10*10^9;


%Set phase center
R0 = 560;

%Set aperture size consider F/D
D = 560;

%Set unit cell size(grid) as lamda/2
unit_cell = lamda/2;


%disp(num_elements)

%Set a phase constant as a relative phase shift between the elements
phi_con = 0;

%Set desired beam direction as (theta_0,phi_0)
phi_0 = 30;
theta_0 = 30;




figure
h = heatmap(phase_profile);
colormap hot
h.Title = 'Phase profile distribution';
output = reshape(phase_profile',[length(phase_profile)^2,1]);
csvwrite('Reflectarray_Phase_Excitation.csv',output)