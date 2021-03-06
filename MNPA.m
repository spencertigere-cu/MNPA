clc
set(0,'DefaultFigureWindowStyle','docked')
%Node 1
R1 = 1;
Cap = 0.25;
%Node 2
R2 = 2;
L = 0.2;
%Node 3
R3 = 10;
%Node 4
R4 = 0.1; 
%Node 5
R0 = 1000; 

G0 = 1/R0;
G1 = 1/R1;
G2 = 1/R2;
G3 = 1/R3;
G4 = 1/R4;

%1a) C & G matricies 
C = zeros(6, 6);
C(2, 1) = Cap; 
C(2, 2) = -Cap;
C(6, 6) = L;

G = zeros(6, 6); 
G(1, 1) = 1;                                        
G(2, 1) = G1; 
G(2, 2) = -(G1 + G2); 
G(2, 6) = -1;   
G(3 ,3) = -G3; 
G(3, 6) = 1;                       
G(4, 3) = -a*G3; 
G(4, 4) = 1;                        
G(5, 5) = -(G4+G0); 
G(5, 4) = G4;   
G(6, 2) = -1; 
G(6, 3) = 1;                

%1b) DC sweep
F = zeros(6, 1);

for vin = -10:0.1:10
    F(1) = vin;
    V = G\F;
end


