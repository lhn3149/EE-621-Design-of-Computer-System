onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /dxp_CAM_v_tb/we_n_tb
add wave -noupdate -radix hexadecimal /dxp_CAM_v_tb/rd_n_tb
add wave -noupdate -radix hexadecimal /dxp_CAM_v_tb/din_tb
add wave -noupdate -radix hexadecimal /dxp_CAM_v_tb/argin_tb
add wave -noupdate -radix hexadecimal /dxp_CAM_v_tb/addrs_tb
add wave -noupdate -radix hexadecimal /dxp_CAM_v_tb/dout_tb
add wave -noupdate -radix binary /dxp_CAM_v_tb/mbits_tb
add wave -noupdate -radix hexadecimal /dxp_CAM_v_tb/i
add wave -noupdate -radix hexadecimal /dxp_CAM_v_tb/dut/we_n
add wave -noupdate -radix hexadecimal /dxp_CAM_v_tb/dut/rd_n
add wave -noupdate -radix hexadecimal /dxp_CAM_v_tb/dut/din
add wave -noupdate -radix hexadecimal /dxp_CAM_v_tb/dut/argin
add wave -noupdate -radix hexadecimal /dxp_CAM_v_tb/dut/addrs
add wave -noupdate -radix hexadecimal /dxp_CAM_v_tb/dut/dout
add wave -noupdate -radix binary /dxp_CAM_v_tb/dut/mbits
add wave -noupdate -radix hexadecimal /dxp_CAM_v_tb/dut/cam_mem
add wave -noupdate -radix hexadecimal /dxp_CAM_v_tb/dut/i
add wave -noupdate -radix hexadecimal /dxp_CAM_v_tb/dut/int_addrs
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {310497 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 141
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
WaveRestoreZoom {0 ps} {828183 ps}
