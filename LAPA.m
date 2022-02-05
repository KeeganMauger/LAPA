close all
clc
clear all

nx = 100;               % Steps of x         
ny = 100;               % Steps of y
NI = 1000;              % Number of iterations
dx = 100/(nx-1);        % Delta x
dy = 100/(ny-1);        % Delta y
x = 0:dx:100;           % Evenly spaced x range
y = 0:dy:100;           % Evenly spaced y range
d = dx;                 % delta = deltax = deltay

T = zeros(ny,nx);       % Solution Matrix
Tx = zeros(ny,nx);
Ty = zeros(ny,nx);
T_next = zeros(ny,nx);      % 
Tx_next = zeros(ny,nx);
Ty_next = zeros(ny,nx);

% Boundary conditions
T(:,1) = 0;     %Bottom
T(:,ny) = 0;    %Top
T(1,:) = 0;     %Left
T(nx,:) = 1;    %Right

Tx(:,1) = 0;     %Bottom
Tx(:,ny) = 0;    %Top
Tx(1,:) = 0;     %Left
Tx(nx,:) = 1;    %Right

Ty(:,1) = 0;     %Bottom
Ty(:,ny) = 0;    %Top
Ty(1,:) = 0;     %Left
Ty(nx,:) = 1;    %Right

m = 2:nx-1;             % From 2 to 99 because BCs at 1 and 100
n = 2:ny-1;             % From 2 to 99 because BCs at 1 and 100

figure(1)
for k = 1:NI
    T_next = T;
    Tx_next = Tx;
    Ty_next = Ty;
    
    T(m,n) = (T_next(m+1,n) + T_next(m-1,n) + T_next(m,n+1) + T_next(m,n-1)) / 4;
    Tx(m,n) = (Tx_next(m+1,n) + Tx_next(m-1,n))/2;
    Ty(m,n) = (Ty_next(m,n+1) + Ty_next(m,n-1))/2;
    
    Ty(:,1) = 0;     %Bottom
    Ty(:,ny) = 0;    %Top
    Ty(1,:) = 0;     %Left
    Ty(nx,:) = 1;    %Right
    
    Tx(:,1) = 0;     %Bottom
    Tx(:,ny) = 0;    %Top
    Tx(1,:) = 0;     %Left
    Tx(nx,:) = 1;    %Right
    
    T(:,1) = 0;     %Bottom
    T(:,ny) = 0;    %Top
    T(1,:) = 0;     %Left
    T(nx,:) = 1;    %Right
    
    figure(1)
    surf(x,y,T)
    pause(0.0001)
    Interation = k
end

figure(2)
E = gradient(T);
Ex = gradient(Tx);
Ey = gradient(Ty);
quiver(Tx,Ty)
    
