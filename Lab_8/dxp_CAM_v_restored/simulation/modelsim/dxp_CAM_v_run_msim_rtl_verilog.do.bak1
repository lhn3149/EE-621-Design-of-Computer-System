transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_8/dxp_CAM_v_restored {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_8/dxp_CAM_v_restored/dxp_CAM_v.v}

vlog -vlog01compat -work work +incdir+E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_8/dxp_CAM_v_restored {E:/RIT/Fall_22/EE-621-Design-of-Computer-System/Lab_8/dxp_CAM_v_restored/dxp_CAM_v_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  dxp_CAM_v_tb

add wave *
view structure
view signals
run -all
