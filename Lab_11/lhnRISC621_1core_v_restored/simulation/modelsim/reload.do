vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_11/lhnRISC621_1core_v_restored {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_11/lhnRISC621_1core_v_restored/lhnRISC621_v.v}
vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_11/lhnRISC621_1core_v_restored {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_11/lhnRISC621_1core_v_restored/lhn_ir2assembly_v.v}
vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_11/lhnRISC621_1core_v_restored {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_11/lhnRISC621_1core_v_restored/lhn_mm.v}
vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_11/lhnRISC621_1core_v_restored {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_11/lhnRISC621_1core_v_restored/lhn_pll_3_v.v}
vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_11/lhnRISC621_1core_v_restored {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_11/lhnRISC621_1core_v_restored/lhn_cache_v.v}
vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_11/lhnRISC621_1core_v_restored {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_11/lhnRISC621_1core_v_restored/lhn_CAM_v.v}
vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_11/lhnRISC621_1core_v_restored {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_11/lhnRISC621_1core_v_restored/lhn_3to8_dec.v}
vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_11/lhnRISC621_1core_v_restored {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_11/lhnRISC621_1core_v_restored/lhn_cache_2w_v.v}
vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_11/lhnRISC621_1core_v_restored {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_11/lhnRISC621_1core_v_restored/FPGA_TopWraper.v}
vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_11/lhnRISC621_1core_v_restored/db {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_11/lhnRISC621_1core_v_restored/db/lhn_pll_3_v_altpll1.v}

vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_11/lhnRISC621_1core_v_restored {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_11/lhnRISC621_1core_v_restored/lhnRISC621_v_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  lhnRISC621_v_tb

do wave.do
restart -force
run -all