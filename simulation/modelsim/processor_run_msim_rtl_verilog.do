transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/vishrant/Downloads/EE\ 337/pronsm/pronsm {C:/Users/vishrant/Downloads/EE 337/pronsm/pronsm/reg_file.v}
vlog -vlog01compat -work work +incdir+C:/Users/vishrant/Downloads/EE\ 337/pronsm/pronsm {C:/Users/vishrant/Downloads/EE 337/pronsm/pronsm/register.v}
vlog -vlog01compat -work work +incdir+C:/Users/vishrant/Downloads/EE\ 337/pronsm/pronsm {C:/Users/vishrant/Downloads/EE 337/pronsm/pronsm/processor.v}
vlog -vlog01compat -work work +incdir+C:/Users/vishrant/Downloads/EE\ 337/pronsm/pronsm {C:/Users/vishrant/Downloads/EE 337/pronsm/pronsm/mux4_to_1.v}
vlog -vlog01compat -work work +incdir+C:/Users/vishrant/Downloads/EE\ 337/pronsm/pronsm {C:/Users/vishrant/Downloads/EE 337/pronsm/pronsm/mux2_to_1.v}
vlog -vlog01compat -work work +incdir+C:/Users/vishrant/Downloads/EE\ 337/pronsm/pronsm {C:/Users/vishrant/Downloads/EE 337/pronsm/pronsm/memory.v}
vlog -vlog01compat -work work +incdir+C:/Users/vishrant/Downloads/EE\ 337/pronsm/pronsm {C:/Users/vishrant/Downloads/EE 337/pronsm/pronsm/datapath.v}
vlog -vlog01compat -work work +incdir+C:/Users/vishrant/Downloads/EE\ 337/pronsm/pronsm {C:/Users/vishrant/Downloads/EE 337/pronsm/pronsm/controller.v}
vlog -vlog01compat -work work +incdir+C:/Users/vishrant/Downloads/EE\ 337/pronsm/pronsm {C:/Users/vishrant/Downloads/EE 337/pronsm/pronsm/alu_risc.v}
vlog -vlog01compat -work work +incdir+C:/Users/vishrant/Downloads/EE\ 337/pronsm/pronsm {C:/Users/vishrant/Downloads/EE 337/pronsm/pronsm/Priority_enc.v}

