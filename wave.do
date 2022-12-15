onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MCPUtb/reset
add wave -noupdate /MCPUtb/clk
add wave -noupdate /MCPUtb/file
add wave -noupdate /MCPUtb/i
add wave -noupdate -radix unsigned /MCPUtb/memi
add wave -noupdate /MCPUtb/cpuinst/clk
add wave -noupdate /MCPUtb/cpuinst/reset
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/pc
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/opcode
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/operand1
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/operand2
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/operand3
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/alu_cmd
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/alu_in1
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/alu_in2
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/alu_out
add wave -noupdate /MCPUtb/cpuinst/CARRY
add wave -noupdate /MCPUtb/cpuinst/regset_cmd
add wave -noupdate /MCPUtb/cpuinst/regset_wb
add wave -noupdate -radix hexadecimal /MCPUtb/cpuinst/regdatatoload
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/RegOp1
add wave -noupdate /MCPUtb/cpuinst/RAMWE
add wave -noupdate /MCPUtb/cpuinst/RAMRE
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/RAMADDR
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/RAMDWRITE
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/RAMDREAD
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/IADDR
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/IREAD
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/wb_cmd
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/instruction
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/MemOrConstant
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/state
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/next_state
add wave -noupdate -radix ascii /MCPUtb/cpuinst/STATE_AS_STR
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/aluinst/cmd
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/aluinst/in1
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/aluinst/in2
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/aluinst/out
add wave -noupdate /MCPUtb/cpuinst/aluinst/CF
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/regfileinst/op1
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/regfileinst/op2
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/regfileinst/op3
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/regfileinst/datatoload
add wave -noupdate /MCPUtb/cpuinst/regfileinst/regsetcmd
add wave -noupdate /MCPUtb/cpuinst/regfileinst/regsetwb
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/regfileinst/RegOp1
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/regfileinst/alu1
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/regfileinst/alu2
add wave -noupdate /MCPUtb/cpuinst/raminst/we
add wave -noupdate /MCPUtb/cpuinst/raminst/re
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/raminst/datawr
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/raminst/addr
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/raminst/instraddr
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/raminst/datard
add wave -noupdate -radix unsigned /MCPUtb/cpuinst/raminst/instrrd
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {282 ps} 0}
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
WaveRestoreZoom {225 ps} {725 ps}
