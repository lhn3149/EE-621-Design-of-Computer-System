onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /lhnRISC621_v_tb/Resetn_tb
add wave -noupdate /lhnRISC621_v_tb/Clock_tb
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/SW_in_tb
add wave -noupdate /lhnRISC621_v_tb/start_multiplication
add wave -noupdate /lhnRISC621_v_tb/Display_out_tb
add wave -noupdate /lhnRISC621_v_tb/ICis_tb
add wave -noupdate /lhnRISC621_v_tb/i
add wave -noupdate /lhnRISC621_v_tb/dut/core_order
add wave -noupdate /lhnRISC621_v_tb/dut/Display_core0
add wave -noupdate /lhnRISC621_v_tb/dut/Display_core1
add wave -noupdate /lhnRISC621_v_tb/dut/Done_core0
add wave -noupdate /lhnRISC621_v_tb/dut/Done_core1
add wave -noupdate /lhnRISC621_v_tb/dut/SW_pin_0
add wave -noupdate /lhnRISC621_v_tb/dut/SW_pin_1
add wave -noupdate -divider core0
add wave -noupdate -radix ascii /lhnRISC621_v_tb/dut/risc_inst_0/ICis
add wave -noupdate /lhnRISC621_v_tb/dut/risc_inst_0/SW_pin
add wave -noupdate /lhnRISC621_v_tb/dut/risc_inst_0/Display_pin
add wave -noupdate /lhnRISC621_v_tb/dut/risc_inst_0/Done
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_0/R[0]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_0/R[1]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_0/R[2]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_0/R[3]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_0/R[4]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_0/R[5]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_0/R[6]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_0/R[7]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_0/R[8]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_0/R[9]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_0/R[10]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_0/R[11]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_0/R[12]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_0/R[13]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_0/R[14]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_0/R[15]}
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/risc_inst_0/MAB
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/risc_inst_0/MAeff
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/risc_inst_0/MAX
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/risc_inst_0/OPDR
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/risc_inst_0/IPDR
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/risc_inst_0/SR
add wave -noupdate -radix unsigned /lhnRISC621_v_tb/dut/risc_inst_0/perf_counter
add wave -noupdate /lhnRISC621_v_tb/dut/risc_inst_0/c0
add wave -noupdate -divider core1
add wave -noupdate -radix ascii /lhnRISC621_v_tb/dut/risc_inst_1/ICis
add wave -noupdate /lhnRISC621_v_tb/dut/risc_inst_1/SW_pin
add wave -noupdate /lhnRISC621_v_tb/dut/risc_inst_1/Display_pin
add wave -noupdate /lhnRISC621_v_tb/dut/risc_inst_1/Done
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_1/R[0]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_1/R[1]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_1/R[2]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_1/R[3]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_1/R[4]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_1/R[5]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_1/R[6]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_1/R[7]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_1/R[8]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_1/R[9]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_1/R[10]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_1/R[11]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_1/R[12]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_1/R[13]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_1/R[14]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/risc_inst_1/R[15]}
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/risc_inst_1/MAB
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/risc_inst_1/MAeff
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/risc_inst_1/SR
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/risc_inst_1/MAX
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/risc_inst_1/IPDR
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/risc_inst_1/OPDR
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/risc_inst_1/PM_out
add wave -noupdate -radix unsigned /lhnRISC621_v_tb/dut/risc_inst_1/perf_counter
add wave -noupdate /lhnRISC621_v_tb/dut/risc_inst_1/c0
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {115635749 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {502845 ns}
