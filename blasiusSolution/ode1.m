function dydx=ode1(x,y)
solinit=bvpinit([0:0.2:10],[0 0 0]);
sol=bvp5c(@ode,@bc,solinit);
yKorak = deval(sol,x);
z = yKorak(2);
dydx=[(1-z)*z;];
end