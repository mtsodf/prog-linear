set INDICES ordered;
set MESES ordered;

param norm_min {MESES};
param norm_max {MESES};
param ext_min {MESES};
param ext_max {MESES};
param sub_min {MESES};
param arm_min {MESES};
param arm_max {MESES};
param custo_norm {MESES};
param custo_ext {MESES};
param custo_sub {MESES};
param custo_arm {MESES};
param demanda {MESES};

 
var x_norm {j in MESES} >= norm_min[j], <= norm_max[j];

var x_ext{j in MESES} >= ext_min[j], <= ext_max[j];

var x_sub{j in MESES} >= sub_min[j];

var x_arm{j in MESES} >= arm_min[j], <= arm_max[j];

minimize Total_Cost:  sum {j in MESES} (x_norm[j]*custo_norm[j] + x_ext[j]*custo_ext[j] + x_sub[j]*custo_sub[j] + x_arm[j]*custo_arm[j]);

subject to Fab1:
	demanda[member(1,MESES)] <= x_norm[member(1,MESES)] + x_ext[member(1,MESES)] + x_sub[member(1,MESES)] - x_arm[member(1,MESES)] <= demanda[member(1,MESES)];

subject to Fab2 {i in INDICES}:
   demanda[member(i,MESES)] <= x_norm[member(i,MESES)] + x_ext[member(i,MESES)] + x_sub[member(i,MESES)] + x_arm[member(i-1,MESES)] - x_arm[member(i,MESES)] <= demanda[member(i,MESES)];
   
