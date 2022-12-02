onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /lhnRISC621_v_tb/Resetn_tb
add wave -noupdate -radix unsigned /lhnRISC621_v_tb/Clock_tb
add wave -noupdate -radix unsigned /lhnRISC621_v_tb/SW_in_tb
add wave -noupdate -radix unsigned /lhnRISC621_v_tb/start_multiplication
add wave -noupdate -radix unsigned /lhnRISC621_v_tb/Display_out_tb
add wave -noupdate -radix unsigned /lhnRISC621_v_tb/i
add wave -noupdate -radix unsigned /lhnRISC621_v_tb/dut/core_order
add wave -noupdate -radix unsigned /lhnRISC621_v_tb/dut/Display_core0
add wave -noupdate -radix unsigned /lhnRISC621_v_tb/dut/Display_core1
add wave -noupdate -radix unsigned /lhnRISC621_v_tb/dut/Display_core2
add wave -noupdate -radix unsigned /lhnRISC621_v_tb/dut/Display_core3
add wave -noupdate -radix unsigned /lhnRISC621_v_tb/dut/Done_core0
add wave -noupdate -radix unsigned /lhnRISC621_v_tb/dut/Done_core1
add wave -noupdate -radix unsigned /lhnRISC621_v_tb/dut/Done_core2
add wave -noupdate -radix unsigned /lhnRISC621_v_tb/dut/Done_core3
add wave -noupdate -radix unsigned /lhnRISC621_v_tb/dut/operation_per_core
add wave -noupdate -radix unsigned /lhnRISC621_v_tb/dut/SW_pin_0
add wave -noupdate -radix unsigned /lhnRISC621_v_tb/dut/SW_pin_1
add wave -noupdate -radix unsigned /lhnRISC621_v_tb/dut/SW_pin_2
add wave -noupdate -radix unsigned /lhnRISC621_v_tb/dut/SW_pin_3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {405823783 ps} 0}
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
WaveRestoreZoom {0 ps} {709317 ns}
