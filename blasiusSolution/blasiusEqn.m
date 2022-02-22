clear all 
clc

format long

solinit=bvpinit([0:0.2:10],[0 0 0]);
sol=bvp5c(@ode,@bc,solinit);

eta=sol.x;
y=sol.y;

[row,column] = size(y);

for i = 1:column
   y(4,i) = -0.5 * y(1,i) * y(3,i);
   y(5,i) = eta(1,i) - y(1,i);
   y(6,i) = eta(1,i)*y(2,i) - y(1,i);
end

hold on
plot(eta,y(1,:),'black','LineWidth',2)
plot(eta,y(2,:),'--black','LineWidth',2)
plot(eta,y(3,:),'-.black','LineWidth',2)
plot(eta,y(4,:),'.black','LineWidth',2)
plot(eta,y(5,:),'blue','LineWidth',2)
plot(eta,y(6,:),'red','LineWidth',2)
xlabel('\eta')
ylabel('\phi')
legend('\phi(\eta)','d\phi(\eta)','d2\phi(\eta)','d3\phi(\eta)','\eta - \phi', '\etad\phi - \phi')
grid on

korak=[0:0.2:0.99 1:0.2:1.99 2:0.2:3.99 4:0.2:10];
y_korak=deval(sol,korak);

integralValues = ode4(@ode1,korak,0);

[row,column] = size(y_korak);

for i = 1:column
   y_korak(4,i) = -0.5 * y_korak(1,i) * y_korak(3,i);
   y_korak(5,i) = korak(1,i) - y_korak(1,i);
   y_korak(6,i) = integralValues(i,1);
   y_korak(7,i) = korak(1,i)*y_korak(2,i) - y_korak(1,i); %eta*dphi - phi
end

disp('        eta               phi                 dphi                  d2phi            d3phi            eta - phi      integral( (1-dphi)*dphi )    eta*dphi - phi')
disp([korak' y_korak(1,:)' y_korak(2,:)' y_korak(3,:)' y_korak(4,:)' y_korak(5,:)' y_korak(6,:)' y_korak(7,:)'])