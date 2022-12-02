transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_12/lhnRISC621_multicore_v_restored {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_12/lhnRISC621_multicore_v_restored/lhnRISC621_v.v}
vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_12/lhnRISC621_multicore_v_restored {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_12/lhnRISC621_multicore_v_restored/lhn_ir2assembly_v.v}
vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_12/lhnRISC621_multicore_v_restored {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_12/lhnRISC621_multicore_v_restored/lhn_mm.v}
vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_12/lhnRISC621_multicore_v_restored {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_12/lhnRISC621_multicore_v_restored/lhn_pll_3_v.v}
vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_12/lhnRISC621_multicore_v_restored {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_12/lhnRISC621_multicore_v_restored/lhn_cache_v.v}
vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_12/lhnRISC621_multicore_v_restored {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_12/lhnRISC621_multicore_v_restored/lhn_CAM_v.v}
vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_12/lhnRISC621_multicore_v_restored {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_12/lhnRISC621_multicore_v_restored/lhn_3to8_dec.v}
vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_12/lhnRISC621_multicore_v_restored {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_12/lhnRISC621_multicore_v_restored/lhn_cache_2w_v.v}
vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_12/lhnRISC621_multicore_v_restored {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_12/lhnRISC621_multicore_v_restored/FPGA_Top_Wrapper.v}
vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_12/lhnRISC621_multicore_v_restored/db {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_12/lhnRISC621_multicore_v_restored/db/lhn_pll_3_v_altpll.v}

vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_12/lhnRISC621_multicore_v_restored {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_12/lhnRISC621_multicore_v_restored/lhnRISC621_v_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  lhnRISC621_v_tb

add wave *
view structure
view signals
run -all
