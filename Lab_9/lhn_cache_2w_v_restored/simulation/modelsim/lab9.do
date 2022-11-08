onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Testbench
add wave -noupdate -radix hexadecimal /lhn_cache_2w_v_tb/MEM_address_tb
add wave -noupdate -radix hexadecimal /lhn_cache_2w_v_tb/MEM_out_tb
add wave -noupdate -radix hexadecimal /lhn_cache_2w_v_tb/MEM_in_tb
add wave -noupdate -radix hexadecimal /lhn_cache_2w_v_tb/WR_tb
add wave -noupdate -radix hexadecimal /lhn_cache_2w_v_tb/Done_tb
add wave -noupdate -radix hexadecimal /lhn_cache_2w_v_tb/i
add wave -noupdate -divider Memory
add wave -noupdate -radix hexadecimal /lhn_cache_2w_v_tb/dut/MEMint_address
add wave -noupdate -radix hexadecimal /lhn_cache_2w_v_tb/dut/MEMint_out
add wave -noupdate -radix hexadecimal /lhn_cache_2w_v_tb/dut/MEMint_RDaddress
add wave -noupdate -radix hexadecimal /lhn_cache_2w_v_tb/dut/MEMint_WRaddress
add wave -noupdate -divider Cache
add wave -noupdate -radix hexadecimal /lhn_cache_2w_v_tb/dut/CACHE_address
add wave -noupdate -radix hexadecimal /lhn_cache_2w_v_tb/dut/CACHE_out
add wave -noupdate -radix hexadecimal /lhn_cache_2w_v_tb/dut/CACHE_in
add wave -noupdate -divider {CAM I/O}
add wave -noupdate -radix hexadecimal /lhn_cache_2w_v_tb/dut/dout0
add wave -noupdate -radix hexadecimal /lhn_cache_2w_v_tb/dut/dout1
add wave -noupdate -radix hexadecimal -childformat {{{/lhn_cache_2w_v_tb/dut/din0[7]} -radix hexadecimal} {{/lhn_cache_2w_v_tb/dut/din0[6]} -radix hexadecimal} {{/lhn_cache_2w_v_tb/dut/din0[5]} -radix hexadecimal} {{/lhn_cache_2w_v_tb/dut/din0[4]} -radix hexadecimal} {{/lhn_cache_2w_v_tb/dut/din0[3]} -radix hexadecimal} {{/lhn_cache_2w_v_tb/dut/din0[2]} -radix hexadecimal} {{/lhn_cache_2w_v_tb/dut/din0[1]} -radix hexadecimal} {{/lhn_cache_2w_v_tb/dut/din0[0]} -radix hexadecimal}} -subitemconfig {{/lhn_cache_2w_v_tb/dut/din0[7]} {-radix hexadecimal} {/lhn_cache_2w_v_tb/dut/din0[6]} {-radix hexadecimal} {/lhn_cache_2w_v_tb/dut/din0[5]} {-radix hexadecimal} {/lhn_cache_2w_v_tb/dut/din0[4]} {-radix hexadecimal} {/lhn_cache_2w_v_tb/dut/din0[3]} {-radix hexadecimal} {/lhn_cache_2w_v_tb/dut/din0[2]} {-radix hexadecimal} {/lhn_cache_2w_v_tb/dut/din0[1]} {-radix hexadecimal} {/lhn_cache_2w_v_tb/dut/din0[0]} {-radix hexadecimal}} /lhn_cache_2w_v_tb/dut/din0
add wave -noupdate -radix hexadecimal /lhn_cache_2w_v_tb/dut/din1
add wave -noupdate -radix hexadecimal /lhn_cache_2w_v_tb/dut/transfer_count
add wave -noupdate -radix hexadecimal /lhn_cache_2w_v_tb/dut/we0
add wave -noupdate -radix hexadecimal /lhn_cache_2w_v_tb/dut/we1
add wave -noupdate -divider {CAM Control}
add wave -noupdate -radix hexadecimal /lhn_cache_2w_v_tb/dut/writeback
add wave -noupdate -radix hexadecimal /lhn_cache_2w_v_tb/dut/miss
add wave -noupdate -radix binary -childformat {{{/lhn_cache_2w_v_tb/dut/replace[7]} -radix binary} {{/lhn_cache_2w_v_tb/dut/replace[6]} -radix binary} {{/lhn_cache_2w_v_tb/dut/replace[5]} -radix binary} {{/lhn_cache_2w_v_tb/dut/replace[4]} -radix binary} {{/lhn_cache_2w_v_tb/dut/replace[3]} -radix binary} {{/lhn_cache_2w_v_tb/dut/replace[2]} -radix binary} {{/lhn_cache_2w_v_tb/dut/replace[1]} -radix binary} {{/lhn_cache_2w_v_tb/dut/replace[0]} -radix binary}} -subitemconfig {{/lhn_cache_2w_v_tb/dut/replace[7]} {-radix binary} {/lhn_cache_2w_v_tb/dut/replace[6]} {-radix binary} {/lhn_cache_2w_v_tb/dut/replace[5]} {-radix binary} {/lhn_cache_2w_v_tb/dut/replace[4]} {-radix binary} {/lhn_cache_2w_v_tb/dut/replace[3]} {-radix binary} {/lhn_cache_2w_v_tb/dut/replace[2]} {-radix binary} {/lhn_cache_2w_v_tb/dut/replace[1]} {-radix binary} {/lhn_cache_2w_v_tb/dut/replace[0]} {-radix binary}} /lhn_cache_2w_v_tb/dut/replace
add wave -noupdate -radix hexadecimal /lhn_cache_2w_v_tb/dut/hit0
add wave -noupdate -radix hexadecimal /lhn_cache_2w_v_tb/dut/hit1
add wave -noupdate -radix binary /lhn_cache_2w_v_tb/dut/mbits0
add wave -noupdate -radix binary /lhn_cache_2w_v_tb/dut/mbits1
add wave -noupdate -radix binary /lhn_cache_2w_v_tb/dut/cam0_init
add wave -noupdate -radix binary /lhn_cache_2w_v_tb/dut/cam1_init
add wave -noupdate -radix binary /lhn_cache_2w_v_tb/dut/cam0_dirty_bit
add wave -noupdate -radix binary /lhn_cache_2w_v_tb/dut/cam1_dirty_bit
add wave -noupdate -radix binary /lhn_cache_2w_v_tb/dut/grp
add wave -noupdate -radix hexadecimal /lhn_cache_2w_v_tb/dut/grp_addrs_field
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3925848 ps} 0}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {1384030 ps} {6113372 ps}
