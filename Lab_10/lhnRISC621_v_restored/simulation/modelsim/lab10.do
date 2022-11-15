onerror {resume}
quietly virtual function -install /lhnRISC621_v_tb/dut -env /lhnRISC621_v_tb/dut { &{/lhnRISC621_v_tb/dut/stall_mc3, /lhnRISC621_v_tb/dut/stall_mc2, /lhnRISC621_v_tb/dut/stall_mc1, /lhnRISC621_v_tb/dut/stall_mc0 }} stalls
quietly virtual function -install /lhnRISC621_v_tb/dut/my_cache -env /lhnRISC621_v_tb/dut/my_cache { &{/lhnRISC621_v_tb/dut/my_cache/hit1, /lhnRISC621_v_tb/dut/my_cache/hit0 }} hits
quietly WaveActivateNextPane {} 0
add wave -noupdate /lhnRISC621_v_tb/Clock_tb
add wave -noupdate /lhnRISC621_v_tb/SW_in_tb
add wave -noupdate /lhnRISC621_v_tb/Display_out_tb
add wave -noupdate -radix ascii /lhnRISC621_v_tb/ICis_tb
add wave -noupdate /lhnRISC621_v_tb/i
add wave -noupdate /lhnRISC621_v_tb/dut/my_cache/Done
add wave -noupdate -divider RF
add wave -noupdate -radix hexadecimal {/lhnRISC621_v_tb/dut/R[10]}
add wave -noupdate -radix hexadecimal {/lhnRISC621_v_tb/dut/R[9]}
add wave -noupdate -radix hexadecimal {/lhnRISC621_v_tb/dut/R[8]}
add wave -noupdate -radix hexadecimal {/lhnRISC621_v_tb/dut/R[7]}
add wave -noupdate -radix hexadecimal {/lhnRISC621_v_tb/dut/R[6]}
add wave -noupdate -radix hexadecimal {/lhnRISC621_v_tb/dut/R[5]}
add wave -noupdate -radix hexadecimal {/lhnRISC621_v_tb/dut/R[4]}
add wave -noupdate -radix hexadecimal {/lhnRISC621_v_tb/dut/R[3]}
add wave -noupdate -radix hexadecimal {/lhnRISC621_v_tb/dut/R[2]}
add wave -noupdate -radix hexadecimal {/lhnRISC621_v_tb/dut/R[1]}
add wave -noupdate -radix hexadecimal {/lhnRISC621_v_tb/dut/R[0]}
add wave -noupdate -divider PM
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/WR_DM
add wave -noupdate /lhnRISC621_v_tb/dut/stalls
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/PC
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/IR3
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/IR2
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/IR1
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/MAeff
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/PM_out
add wave -noupdate -divider DP
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/MAB
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/MAX
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/MA
add wave -noupdate /lhnRISC621_v_tb/dut/Ri1
add wave -noupdate /lhnRISC621_v_tb/dut/Rj1
add wave -noupdate /lhnRISC621_v_tb/dut/Ri2
add wave -noupdate /lhnRISC621_v_tb/dut/Rj2
add wave -noupdate /lhnRISC621_v_tb/dut/Ri3
add wave -noupdate /lhnRISC621_v_tb/dut/Rj3
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/DM_in
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/DM_out
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/SP
add wave -noupdate -divider ALU
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/TA
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/TB
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/TALUH
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/TALUL
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/TSR
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/SR
add wave -noupdate -divider Cache
add wave -noupdate /lhnRISC621_v_tb/dut/my_cache/hits
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/my_cache/cam0_dirty_bit
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/my_cache/cam1_dirty_bit
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/my_cache/mbits0
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/my_cache/mbits1
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/my_cache/grp
add wave -noupdate /lhnRISC621_v_tb/dut/my_cache/we0
add wave -noupdate /lhnRISC621_v_tb/dut/my_cache/we1
add wave -noupdate /lhnRISC621_v_tb/dut/my_cache/writeback
add wave -noupdate /lhnRISC621_v_tb/dut/my_cache/miss
add wave -noupdate /lhnRISC621_v_tb/dut/my_cache/wren
add wave -noupdate /lhnRISC621_v_tb/dut/my_cache/hit0
add wave -noupdate /lhnRISC621_v_tb/dut/my_cache/hit1
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/my_cache/replace
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/my_cache/CACHE_address
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/my_cache/din0
add wave -noupdate -radix hexadecimal /lhnRISC621_v_tb/dut/my_cache/din1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {11380000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 151
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {52510960 ps}
