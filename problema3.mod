param nDepositos integer;
param nClientes integer;


param custo_fixo{1 .. nDepositos} >= 100, <= 500;
param custo_transporte{1 .. nClientes, 1 .. nDepositos} >= 10, <=50;



var x{i in 1 .. nClientes, j in 1 .. nDepositos} >= 0, <= 1;
var y{j in 1 .. nDepositos} integer >= 0, <=1;


minimize GastoTotal: sum{j in 1 .. nDepositos, i in 1 .. nClientes} custo_transporte[i, j]*x[i, j] + sum{j in 1 .. nDepositos} custo_fixo[j]*y[j];


subject to Satisfacoes{i in 1 .. nClientes}:
    1 <= sum{j in 1 .. nDepositos} x[i, j] <= 1;


subject to Garantia{j in 1 .. nDepositos}:
    sum {i in 1 .. nClientes}x[i, j] <= nDepositos*y[j];