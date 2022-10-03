transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/grobb/Documents/University/Digital_Systems/Labs/Lab_1/VHDL/lab1/h2InMux.vhd}

vcom -93 -work work {C:/Users/grobb/Documents/University/Digital_Systems/Labs/Lab_1/VHDL/lab1/h2InMux_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  h2InMux_tb

add wave *
view structure
view signals
run -all
