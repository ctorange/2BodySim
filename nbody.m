
[X,Y,Z]=meshgrid(-1:0.1:1,-1:0.1:1,-1:0.1:1);


m1 = 1000; %mass of object 1 "the sun"
m2 = 100; %mass of object 2 "the earth"


G = 1; %big G


pos1x = 0;
pos1y = 0;
pos1z = 0;

pos2x = 0.25;
pos2y = 0.25;
pos2z = 0.25;

vel1x = 0;
vel1y = -3;
vel1z = 0;

vel2x = 0;
vel2y = 30;
vel2z = 0;

dt = 0.0001;

x1All = zeros(100000,1);
y1All = zeros(100000,1);
z1All = zeros(100000,1);
x2All = zeros(100000,1);
y2All = zeros(100000,1);
z2All = zeros(100000,1);

figure




for i = 1:100000

    r12x = pos2x - pos1x; % x comp of r12
    r12y = pos2y - pos1y; % y comp of r12
    r12z = pos2z - pos1z; % z comp of r12

    r12 = sqrt(r12x*r12x+r12y*r12y+r12z*r12z+1e-8);

    r21x  = -r12x; % x comp of r12
    r21y  = -r12y; % y comp of r12
    r21z  = -r12z; % z comp of r12

    r21 = sqrt(r21x*r21x+r21y*r21y+r21z*r21z+1e-8);


    a1x = G*m2*(r12x/(r12*r12*r12));
    a1y = G*m2*(r12y/(r12*r12*r12));
    a1z = G*m2*(r12z/(r12*r12*r12));

    a2x = G*m1*(r21x/(r21*r21*r21));
    a2y = G*m1*(r21y/(r21*r21*r21));
    a2z = G*m1*(r21z/(r21*r21*r21));

    vel1x = a1x*dt + vel1x;
    vel1y = a1y*dt + vel1y;
    vel1z = a1z*dt + vel1z;

    vel2x = a2x*dt + vel2x;
    vel2y = a2y*dt + vel2y;
    vel2z = a2z*dt + vel2z;

    pos1x = pos1x + vel1x*dt;
    pos1y = pos1y + vel1y*dt;
    pos1z = pos1z + vel1z*dt;

    pos2x = pos2x + vel2x*dt;
    pos2y = pos2y + vel2y*dt;
    pos2z = pos2z + vel2z*dt;
    
    x1All(i) = pos1x;
    y1All(i) = pos1y;
    z1All(i) = pos1z;
    x2All(i) = pos2x;
    y2All(i) = pos2y;
    z2All(i) = pos2z;
    
    
    Fx = (m1*a1x + m2*a2x);
    Fy = (m1*a1y + m2*a2y);
    Fz = (m1*a1z + m2*a2z);
    
    
    plot3(x1All(i),y1All(i),z1All(i),'*y')
    xlim([-1 1])
    ylim([-1 1])
    zlim([-1 1])
    
    set(gca,'Color','k') %make background black
    hold on
    plot3(x2All(i),y2All(i),z2All(i),'.c')
    hold off
    %quiver(X,Y,Z,Fx,Fy,Fz)
    drawnow
    end

hold off

axis equal