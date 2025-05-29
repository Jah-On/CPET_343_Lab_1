onerror {resume}
quietly WaveActivateNextPane {} 0

# Add wave lines here...  i.e. add wave -noupdate -color #eb34eb /tb/led_output
add wave -noupdate -color #FF0000 /singleBitAdder_agnostic_bench/a
add wave -noupdate -color #00FF00 /singleBitAdder_agnostic_bench/b
add wave -noupdate -color #0000FF /singleBitAdder_agnostic_bench/cin
add wave -noupdate -color #FF00FF /singleBitAdder_agnostic_bench/sum
add wave -noupdate -color #FFFF00 /singleBitAdder_agnostic_bench/cout

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {50 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 177
configure wave -valuecolwidth 40
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
WaveRestoreZoom {101 ns} {206 ns}
run 500 ns