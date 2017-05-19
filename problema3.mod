set DEPOSITOS ordered;
set CLIENTES ordered;

param m integer;
param n integer;


param custo_fixo{DEPOSITOS} >= 100, <= 500;
param custo_transporte{CLIENTES, DEPOSITOS} >= 10, <=50;



var x{i in CLIENTES, j in DEPOSITOS} >= 0, <= 1;
var y{j in DEPOSITOS} integer >= 0, <=1;


minimize GastoTotal: sum{j in DEPOSITOS, i in CLIENTES} custo_transporte[i, j]*x[i, j] + sum{j in DEPOSITOS} custo_fixo[j]*y[j];


subject to Satisfacoes{i in CLIENTES}:
    1 <= sum{j in DEPOSITOS} x[i, j] <= 1;


subject to Garantia{j in DEPOSITOS}:
    sum {i in CLIENTES}x[i, j] <= m*y[j];