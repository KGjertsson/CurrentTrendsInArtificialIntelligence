seed =[0 1 0 0 1;1 0 0 1 0;0 0 0 1 0;0 1 1 0 0;1 0 0 0 0];
Net = SFNG(100, 1, seed); 
PL_Equation = PLplot(Net);
CNet(Net);
