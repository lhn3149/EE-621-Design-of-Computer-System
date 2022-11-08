onerror {resume}
quietly virtual function -install /dxp_cache_2w_v_tb/dut -env /dxp_cache_2w_v_tb { &{/dxp_cache_2w_v_tb/dut/we0, /dxp_cache_2w_v_tb/dut/we1 }} we
quietly virtual signal -install /dxp_cache_2w_v_tb/dut {/dxp_cache_2w_v_tb/dut/we1  } we001
quietly virtual function -install /dxp_cache_2w_v_tb/dut -env /dxp_cache_2w_v_tb { (concat_ascending)&{/dxp_cache_2w_v_tb/dut/we0, /dxp_cache_2w_v_tb/dut/we1 }} we002
quietly virtual function -install /dxp_cache_2w_v_tb/dut -env /dxp_cache_2w_v_tb { (concat_ascending)&{/dxp_cache_2w_v_tb/dut/hit0, /dxp_cache_2w_v_tb/dut/hit1 }} hit
quietly virtual function -install /dxp_cache_2w_v_tb/dut -env /dxp_cache_2w_v_tb { &{/dxp_cache_2w_v_tb/dut/hit1, /dxp_cache_2w_v_tb/dut/hit0 }} hit001
quietly virtual function -install /dxp_cache_2w_v_tb/dut -env /dxp_cache_2w_v_tb/dut { &{/dxp_cache_2w_v_tb/dut/we1, /dxp_cache_2w_v_tb/dut/we0 }} we003
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Testbench
add wave -noupdate /dxp_cache_2w_v_tb/dut/Clock
add wave -noupdate /dxp_cache_2w_v_tb/dut/c0
add wave -noupdate /dxp_cache_2w_v_tb/dut/c1
add wave -noupdate /dxp_cache_2w_v_tb/dut/c2
add wave -noupdate -radix hexadecimal /dxp_cache_2w_v_tb/MEM_address_tb
add wave -noupdate -radix hexadecimal /dxp_cache_2w_v_tb/MEM_out_tb
add wave -noupdate -radix hexadecimal /dxp_cache_2w_v_tb/MEM_in_tb
add wave -noupdate /dxp_cache_2w_v_tb/Resetn_tb
add wave -noupdate /dxp_cache_2w_v_tb/WR_tb
add wave -noupdate /dxp_cache_2w_v_tb/Clock_tb
add wave -noupdate /dxp_cache_2w_v_tb/Done_tb
add wave -noupdate /dxp_cache_2w_v_tb/i
add wave -noupdate /dxp_cache_2w_v_tb/MC_tb
add wave -noupdate -divider Memory
add wave -noupdate -radix hexadecimal /dxp_cache_2w_v_tb/dut/MEM_address
add wave -noupdate -radix hexadecimal /dxp_cache_2w_v_tb/dut/MEMint_address
add wave -noupdate -radix hexadecimal /dxp_cache_2w_v_tb/dut/MEMint_out
add wave -noupdate -radix hexadecimal /dxp_cache_2w_v_tb/dut/MEMint_RDaddress
add wave -noupdate /dxp_cache_2w_v_tb/dut/MEMint_WRaddress
add wave -noupdate -divider Cache
add wave -noupdate -radix hexadecimal /dxp_cache_2w_v_tb/dut/CACHE_address
add wave -noupdate -radix hexadecimal /dxp_cache_2w_v_tb/dut/CACHE_in
add wave -noupdate -radix hexadecimal /dxp_cache_2w_v_tb/dut/CACHE_out
add wave -noupdate -divider {CAM I/O}
add wave -noupdate -radix hexadecimal /dxp_cache_2w_v_tb/dut/din0
add wave -noupdate -radix hexadecimal /dxp_cache_2w_v_tb/dut/din1
add wave -noupdate -radix hexadecimal /dxp_cache_2w_v_tb/dut/dout0
add wave -noupdate -radix hexadecimal /dxp_cache_2w_v_tb/dut/dout1
add wave -noupdate -radix hexadecimal /dxp_cache_2w_v_tb/dut/mbits0
add wave -noupdate -radix hexadecimal /dxp_cache_2w_v_tb/dut/mbits1
add wave -noupdate -divider {CAM control}
add wave -noupdate -radix hexadecimal /dxp_cache_2w_v_tb/dut/grp
add wave -noupdate -label we /dxp_cache_2w_v_tb/dut/we003
add wave -noupdate /dxp_cache_2w_v_tb/dut/WRint
add wave -noupdate /dxp_cache_2w_v_tb/dut/wren
add wave -noupdate -label hit /dxp_cache_2w_v_tb/dut/hit001
add wave -noupdate /dxp_cache_2w_v_tb/dut/miss
add wave -noupdate /dxp_cache_2w_v_tb/dut/writeback
add wave -noupdate -radix hexadecimal /dxp_cache_2w_v_tb/dut/replace
add wave -noupdate -radix hexadecimal /dxp_cache_2w_v_tb/dut/transfer_count
add wave -noupdate -radix hexadecimal /dxp_cache_2w_v_tb/dut/cam0_init
add wave -noupdate -radix hexadecimal /dxp_cache_2w_v_tb/dut/cam1_init
add wave -noupdate -radix hexadecimal /dxp_cache_2w_v_tb/dut/cam0_dirty_bit
add wave -noupdate -radix hexadecimal /dxp_cache_2w_v_tb/dut/cam1_dirty_bit
add wave -noupdate /dxp_cache_2w_v_tb/dut/grp_addrs_field
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {331971 ps} 0}
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
WaveRestoreZoom {83714 ps} {423236 ps}
