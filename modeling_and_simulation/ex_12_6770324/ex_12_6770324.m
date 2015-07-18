clear;

eps0=8.854e-12; % vacuum permittivity
mu0=4.*pi*1e-7; % vacuum permeability
c0=1./sqrt(eps0*mu0); % speed of electromagnetic waves in vacuum.

lambda0=1000e-9; % set wavelength of source to 1000nm
freq=c0/lambda0; % frequency of source in vacuum

dz=lambda0/40.; % set spatial grid spacing
dt=dz*sqrt(eps0*mu0); % As stated in the lecture, it is a requirement for the relation between step units.(where dt can be equal or smaller to the right expression). 

nz=3000; % set number of spatial points
nt=1500; % set number of iterations

eps_r(1:nz)=1.; % this initialized with ones row vector represents a container for the values of the relative permittivity of the dielectric slab and the air (the wave will travel through the air before reaching the dielectric slab) at each of the 3000 different positions on which we are making our measurements. Its number of elements represent the quantity of step units dz neccessary to cover the lenght of this system. 
eps_r(nz/2:nz/2+round(2000e-9/dz))=4.0; % defining the dimension of the dielectric slab (in terms of spatial step units) by loading on its fixed points for measurement its relative permittivity. So According to this this material starts at position 1500 until 1560 and the rest is just air
% the upper limit correspond to the initial position of the dielectric slab + the thickness of it (2000nm) but divided by the step unit dz in order to express the system as a grid (discrete)


E(1:nz)=0; % This row represents the electrical field present in each point of measurement i*dz at a specific time
H(1:nz)=0; % This row represents the magnetic field present in each point of measurement i*dz at a specific time
Eep0(1:nz)=0; % No dielectric slab
Hep0(1:nz)=0; % No dielectric slab
yaxis(1:nz)=0; 

i_source=nz*0.4 % Origin of wave
source=@(t) sin(2.*pi*freq*t)*exp(-((t-4./freq)/(2./freq))^2) % Time dependant signal which is responsible of the generation of the fields
 

for j=1:nt
    yaxis(1:nz)=j*dt; % time axis for 3d plot
    
    for i=2:nz
        H(i)= H(i)+(dt/(dz*mu0))*(E(i)-E(i-1)); % Loop used to determine the magnetic field, since we are plotting inside the same time loop the whole behaviour of the space we can treat H(i) as the new value while at the same time as the previous one
        Hep0(i)= Hep0(i)+(dt/(dz*mu0))*(Eep0(i)-Eep0(i-1)); % Without dielectric slab
    end
    
    for i=1:nz-1
        E(i)= E(i)+(dt/(eps0*eps_r(i)))*(1/dz)*(H(i+1)-H(i)); % Loop used to determine the electric field, since we are plotting inside the same time loop the whole behaviour of the space we can treat E(i) as the new value while at the same time as the previous one
        Eep0(i)= Eep0(i)+(dt/(eps0))*(1/dz)*(Hep0(i+1)-Hep0(i)); % Without dielectric slab
    end
    
    E(i_source)=E(i_source)-source(j*dt); % Calculating the new value in the origin of the wave
    Eep0(i_source)=Eep0(i_source)-source(j*dt); % Calculating the new value in the origin of the wave
    
end

plot3((1:nz)*dz,yaxis,E,(1:nz)*dz,yaxis,eps_r>1); % Plots the electric field present during aspecific time while remarking the one behaviour of the one in the dielectric slab
zlim( [-1.5 1.5] ); % fix scaling of the plot
ylim( [0 nt*dt] )
xlim( [0 nz*dz] )
title ('with dielectric slab');
xlabel ('space/m');
zlabel ('electric field');
ylabel ('time/s');
grid on;


figure
plot3((1:nz)*dz,yaxis,Eep0); % Plots the electric field present during aspecific time while remarking the one behaviour of the one in the dielectric slab
zlim( [-1.5 1.5] ); % fix scaling of the plot
ylim( [0 nt*dt] )
xlim( [0 nz*dz] )
title ('without dielectric slab');
xlabel ('space/m');
zlabel ('electric field');
ylabel ('time/s');
grid on