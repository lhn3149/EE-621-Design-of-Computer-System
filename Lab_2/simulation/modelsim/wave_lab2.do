onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/Resetn_tb
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/Clock_tb
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/SW_in_tb
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/Display_out_tb
add wave -noupdate -radix ascii /lhnRISC621_v_tb/ICis_tb
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/i
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/MC
add wave -noupdate -divider {Reg File}
add wave -noupdate -radix hexadecimal {/lhnRISC621_v_tb/dut/R[4]}
add wave -noupdate -radix hexadecimal {/lhnRISC621_v_tb/dut/R[3]}
add wave -noupdate -radix hexadecimal {/lhnRISC621_v_tb/dut/R[2]}
add wave -noupdate -radix hexadecimal {/lhnRISC621_v_tb/dut/R[1]}
add wave -noupdate -radix hexadecimal {/lhnRISC621_v_tb/dut/R[0]}
add wave -noupdate -divider Instruction
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/PC
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/PM_out
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/IR
add wave -noupdate -divider Memory
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/MAB
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/MAX
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/MA
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/MAeff
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/DM_in
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/DM_out
add wave -noupdate -divider ALU
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/TA
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/TB
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/TALUout
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/TALUH
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/TALUL
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/TSR
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/SR
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ps} {8192 ns}
