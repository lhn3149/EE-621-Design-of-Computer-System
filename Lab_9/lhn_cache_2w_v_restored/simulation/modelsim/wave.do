onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/MEM_address_tb
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/MEM_in_tb
add wave -noupdate /lhn_cache_2w_v_tb/Resetn_tb
add wave -noupdate /lhn_cache_2w_v_tb/WR_tb
add wave -noupdate /lhn_cache_2w_v_tb/Clock_tb
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/MEM_out_tb
add wave -noupdate /lhn_cache_2w_v_tb/Done_tb
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/MEM_out_check_tb
add wave -noupdate /lhn_cache_2w_v_tb/i
add wave -noupdate /lhn_cache_2w_v_tb/failcount
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/MEM_address
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/Resetn
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/WR
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/Clock
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/MEM_in
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/MEM_out
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/Done
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/mbits0
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/mbits1
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/grp
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/MEMint_out
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/CACHE_out
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/CACHE_in
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/c0
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/c1
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/c2
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/mem_clk
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/cache_clk
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/dout0
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/dout1
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/wren
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/WRint
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/writeback
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/CACHE_address
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/MEMint_address
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/MEMint_RDaddress
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/MEMint_WRaddress
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/we0
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/we1
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/miss
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/hit0
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/hit1
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/replace
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/din0
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/din1
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/transfer_count
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/cam0_init
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/cam1_init
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/cam0_dirty_bit
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/cam1_dirty_bit
add wave -noupdate -radix unsigned /lhn_cache_2w_v_tb/dut/grp_addrs_field
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {219943500 ps} 0}
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
WaveRestoreZoom {219700 ns} {220018118 ps}
