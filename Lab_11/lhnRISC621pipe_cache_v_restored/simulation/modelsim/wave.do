onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/Resetn_tb
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/Clock_tb
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/SW_in_tb
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/start_multiplication
add wave -noupdate -radix unsigned /lhnRISC621_v_tb/Display_out_tb
add wave -noupdate -radix ascii /lhnRISC621_v_tb/ICis_tb
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/i
add wave -noupdate -radix hexadecimal {/lhnRISC621_v_tb/dut/R[0]}
add wave -noupdate -radix hexadecimal {/lhnRISC621_v_tb/dut/R[1]}
add wave -noupdate -radix hexadecimal {/lhnRISC621_v_tb/dut/R[2]}
add wave -noupdate -radix hexadecimal {/lhnRISC621_v_tb/dut/R[3]}
add wave -noupdate -radix hexadecimal {/lhnRISC621_v_tb/dut/R[4]}
add wave -noupdate -radix hexadecimal {/lhnRISC621_v_tb/dut/R[5]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/R[6]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/R[7]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/R[8]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/R[9]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/R[10]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/R[11]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/R[12]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/R[13]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/R[14]}
add wave -noupdate -radix unsigned {/lhnRISC621_v_tb/dut/R[15]}
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/MAB
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/MAeff
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/MAX
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/PC
add wave -noupdate -radix unsigned /lhnRISC621_v_tb/dut/perf_counter
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/PM_out
add wave -noupdate -radix hexadecimal -childformat {{{/lhnRISC621_v_tb/dut/TA[13]} -radix hexadecimal} {{/lhnRISC621_v_tb/dut/TA[12]} -radix hexadecimal} {{/lhnRISC621_v_tb/dut/TA[11]} -radix hexadecimal} {{/lhnRISC621_v_tb/dut/TA[10]} -radix hexadecimal} {{/lhnRISC621_v_tb/dut/TA[9]} -radix hexadecimal} {{/lhnRISC621_v_tb/dut/TA[8]} -radix hexadecimal} {{/lhnRISC621_v_tb/dut/TA[7]} -radix hexadecimal} {{/lhnRISC621_v_tb/dut/TA[6]} -radix hexadecimal} {{/lhnRISC621_v_tb/dut/TA[5]} -radix hexadecimal} {{/lhnRISC621_v_tb/dut/TA[4]} -radix hexadecimal} {{/lhnRISC621_v_tb/dut/TA[3]} -radix hexadecimal} {{/lhnRISC621_v_tb/dut/TA[2]} -radix hexadecimal} {{/lhnRISC621_v_tb/dut/TA[1]} -radix hexadecimal} {{/lhnRISC621_v_tb/dut/TA[0]} -radix hexadecimal}} -subitemconfig {{/lhnRISC621_v_tb/dut/TA[13]} {-height 15 -radix hexadecimal} {/lhnRISC621_v_tb/dut/TA[12]} {-height 15 -radix hexadecimal} {/lhnRISC621_v_tb/dut/TA[11]} {-height 15 -radix hexadecimal} {/lhnRISC621_v_tb/dut/TA[10]} {-height 15 -radix hexadecimal} {/lhnRISC621_v_tb/dut/TA[9]} {-height 15 -radix hexadecimal} {/lhnRISC621_v_tb/dut/TA[8]} {-height 15 -radix hexadecimal} {/lhnRISC621_v_tb/dut/TA[7]} {-height 15 -radix hexadecimal} {/lhnRISC621_v_tb/dut/TA[6]} {-height 15 -radix hexadecimal} {/lhnRISC621_v_tb/dut/TA[5]} {-height 15 -radix hexadecimal} {/lhnRISC621_v_tb/dut/TA[4]} {-height 15 -radix hexadecimal} {/lhnRISC621_v_tb/dut/TA[3]} {-height 15 -radix hexadecimal} {/lhnRISC621_v_tb/dut/TA[2]} {-height 15 -radix hexadecimal} {/lhnRISC621_v_tb/dut/TA[1]} {-height 15 -radix hexadecimal} {/lhnRISC621_v_tb/dut/TA[0]} {-height 15 -radix hexadecimal}} /lhnRISC621_v_tb/dut/TA
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/TALUH
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/TALUL
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/TALUout
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/SR
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/IPDR
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/OPDR
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/IR1
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/IR2
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/IR3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {486084327 ps} 0}
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
WaveRestoreZoom {461412652 ps} {508107468 ps}
