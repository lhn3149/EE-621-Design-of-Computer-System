transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Long\ Nguyen/Documents/RIT/RIT_Fall_22/EE_621/EE-621-Design-of-Computer-System/Lab_9/dxp_cache_2w_v_restored {C:/Users/Long Nguyen/Documents/RIT/RIT_Fall_22/EE_621/EE-621-Design-of-Computer-System/Lab_9/dxp_cache_2w_v_restored/dxpRISC521_ram1.v}
vlog -vlog01compat -work work +incdir+C:/Users/Long\ Nguyen/Documents/RIT/RIT_Fall_22/EE_621/EE-621-Design-of-Computer-System/Lab_9/dxp_cache_2w_v_restored {C:/Users/Long Nguyen/Documents/RIT/RIT_Fall_22/EE_621/EE-621-Design-of-Computer-System/Lab_9/dxp_cache_2w_v_restored/dxp_pll_3_v.v}
vlog -vlog01compat -work work +incdir+C:/Users/Long\ Nguyen/Documents/RIT/RIT_Fall_22/EE_621/EE-621-Design-of-Computer-System/Lab_9/dxp_cache_2w_v_restored {C:/Users/Long Nguyen/Documents/RIT/RIT_Fall_22/EE_621/EE-621-Design-of-Computer-System/Lab_9/dxp_cache_2w_v_restored/dxp_CAM_v.v}
vlog -vlog01compat -work work +incdir+C:/Users/Long\ Nguyen/Documents/RIT/RIT_Fall_22/EE_621/EE-621-Design-of-Computer-System/Lab_9/dxp_cache_2w_v_restored {C:/Users/Long Nguyen/Documents/RIT/RIT_Fall_22/EE_621/EE-621-Design-of-Computer-System/Lab_9/dxp_cache_2w_v_restored/dxp_cache_v.v}
vlog -vlog01compat -work work +incdir+C:/Users/Long\ Nguyen/Documents/RIT/RIT_Fall_22/EE_621/EE-621-Design-of-Computer-System/Lab_9/dxp_cache_2w_v_restored {C:/Users/Long Nguyen/Documents/RIT/RIT_Fall_22/EE_621/EE-621-Design-of-Computer-System/Lab_9/dxp_cache_2w_v_restored/dxp_cache_2w_v.v}
vlog -vlog01compat -work work +incdir+C:/Users/Long\ Nguyen/Documents/RIT/RIT_Fall_22/EE_621/EE-621-Design-of-Computer-System/Lab_9/dxp_cache_2w_v_restored {C:/Users/Long Nguyen/Documents/RIT/RIT_Fall_22/EE_621/EE-621-Design-of-Computer-System/Lab_9/dxp_cache_2w_v_restored/dxp_4to16_dec.v}
vlog -vlog01compat -work work +incdir+C:/Users/Long\ Nguyen/Documents/RIT/RIT_Fall_22/EE_621/EE-621-Design-of-Computer-System/Lab_9/dxp_cache_2w_v_restored/db {C:/Users/Long Nguyen/Documents/RIT/RIT_Fall_22/EE_621/EE-621-Design-of-Computer-System/Lab_9/dxp_cache_2w_v_restored/db/dxp_pll_3_v_altpll.v}

vlog -vlog01compat -work work +incdir+C:/Users/Long\ Nguyen/Documents/RIT/RIT_Fall_22/EE_621/EE-621-Design-of-Computer-System/Lab_9/dxp_cache_2w_v_restored {C:/Users/Long Nguyen/Documents/RIT/RIT_Fall_22/EE_621/EE-621-Design-of-Computer-System/Lab_9/dxp_cache_2w_v_restored/dxp_cache_2w_v_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  dxp_cache_2w_v_tb

add wave *
view structure
view signals
run -all
