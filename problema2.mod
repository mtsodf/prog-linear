set PRODUTOS ordered;
set MATERIA_PRIMA ordered;

param lucro {PRODUTOS};
param qtd {MATERIA_PRIMA, PRODUTOS};
param disp  {MATERIA_PRIMA};


var x {j in PRODUTOS} >= 0;

maximize Lucro_Total:  sum {j in PRODUTOS} (lucro[j]*x[j]);

subject to Restricoes {i in MATERIA_PRIMA}:
    sum {j in PRODUTOS} x[j]*qtd[i, j]  <= disp[i];
