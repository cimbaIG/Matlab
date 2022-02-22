function dydx=ode(x,y)
dydx=[y(2); y(3); (-y(1)*y(3))/2;];
end