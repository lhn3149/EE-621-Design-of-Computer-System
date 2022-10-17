vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_2 {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_2/lhnRISC621_v.v}
vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_2 {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_2/lhn_ir2assembly_v.v}
vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_2 {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_2/lhn_mm.v}

vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_2 {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_2/lhnRISC621_v_tb.v}

#vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  lhnRISC621_v_tb

do lab6.do
restart -force
log * -r
run -all
