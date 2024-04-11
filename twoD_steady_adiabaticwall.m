clc;
clear all;

%% geometric information of domain 

W = 1;                  % width of domain in m
H = 1;                  % height of domain in m
Nx = 101;                % no of grids in x direction
Ny = 101;                % no of grid pts in y dirn

dx = W/(Nx-1);
dy = H/(Ny-1);

%% boundary and initial conditions

T = 25*ones(Nx,Ny);           % initial temp of entire plate 25deg C
TL = 120;                     % left wall temp
                      % right wall
TT = 40;                      % top wall
TB = 120;                      % bottom wall 

T(1,1:Ny-1) = TL;             % all the elements on left wall are kept at a temp of 120deg C
T(2:Nx,Ny) = TT;            % all the grid elements on the top wall
T(2:Nx,1) = TB;             % all the grid elements on bottom wall
            % all the grid points on right wall

           % for the corner points temp definition

T(1,Ny) = (TT+TL)/2;


%% computation 

Epsilon = 1e-3;
error = 5;                      % calculation keeps going until error is < epsilon
iter = 0;
while(error>Epsilon)
    iter = iter+1;
    disp(iter);
    Told = T;
    for j = 2:Ny-1
        for i = 2:Nx
            if i == Nx
                T(i,j) = T(i-1,j);
            else
                T(i,j) = (T(i+1,j)+T(i-1,j)+T(i,j+1)+T(i,j-1))/4;
            end
        end

    end
    error = sqrt(sumsqr(T-Told));
    disp(error);
end

%% plotting

x = 0:dx:W;
y = 0:dy:H;

colormap("jet");
contourf(x, y, T');
colorbar;
title("temp Dist");
xlabel("Width in m");
ylabel("length in m");






