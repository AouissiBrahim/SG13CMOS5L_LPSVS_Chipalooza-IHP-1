v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {Ctrl-Click to execute launcher} -890 -650 0 0 0.3 0.3 {layer=11}
N -1280 -860 -1280 -840 {lab=VDD}
N -1140 -860 -1140 -840 {lab=VDD}
N -1280 -780 -1280 -760 {lab=0}
N -1280 -670 -1280 -650 {lab=VCORE}
N -1280 -590 -1280 -570 {lab=0}
N -1130 -320 -1100 -320 {lab=#net1}
N -1130 -330 -1130 -320 {lab=#net1}
N -1040 -320 -1010 -320 {lab=0}
N -1010 -320 -1010 -300 {lab=0}
N -1140 -780 -1140 -760 {lab=I_Bais}
C {/foss/designs/LPSVS/LPVSV.sym} -1100 -370 0 0 {name=x1}
C {isource.sym} -1140 -810 0 0 {name=I0 value=1u}
C {vsource.sym} -1280 -810 0 0 {name=V1 value=3.3 savecurrent=false}
C {lab_pin.sym} -1280 -860 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -1140 -860 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {gnd.sym} -1280 -760 0 0 {name=l2 lab=0}
C {lab_pin.sym} -1120 -470 0 1 {name=p4 sig_type=std_logic lab=I_Bais}
C {lab_pin.sym} -1190 -470 0 1 {name=p5 sig_type=std_logic lab=VDD}
C {vsource.sym} -1280 -620 0 0 {name=V2 value="pulse(0 1.2 1m 5m 5m 10m 22m)" savecurrent=false
}
C {lab_pin.sym} -1280 -670 0 0 {name=p6 sig_type=std_logic lab=VCORE}
C {gnd.sym} -1280 -570 0 0 {name=l3 lab=0}
C {lab_pin.sym} -1270 -400 0 0 {name=p7 sig_type=std_logic lab=VCORE}
C {gnd.sym} -1010 -300 0 0 {name=l4 lab=0}
C {ammeter.sym} -1070 -320 3 1 {name=Vmeas savecurrent=true spice_ignore=0}
C {lab_pin.sym} -1040 -420 2 0 {name=p8 sig_type=std_logic lab=RST}
C {lab_pin.sym} -1040 -390 2 0 {name=p9 sig_type=std_logic lab=F_RST}
C {simulator_commands_shown.sym} -920 -750 0 0 {
name=Libs_Ngspice1
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOSlv.lib mos_tt_mismatch
.lib cornerMOShv.lib mos_tt_mismatch
.include sg13cmos5l_stdcell.spice
"
      }
C {launcher.sym} -840 -605 0 0 {name=h2
descr=SimulatePARALLEL
tclcommand="
# Setup the default simulation commands if not already set up
# for example by already launched simulations.
set_sim_defaults
puts $sim(spice,1,cmd) 

# Change the Xyce command. In the spice category there are currently
# 5 commands (0, 1, 2, 3, 4). Command 3 is the Xyce batch
# you can get the number by querying $sim(spice,n)
set sim(spice,1,cmd) \{ngspice  \\"$N\\" -a\}

# change the simulator to be used (Xyce)
set sim(spice,default) 0

# Create FET and BIP .save file
mkdir -p $netlist_dir
write_data [save_params] $netlist_dir/[file rootname [file tail [xschem get current_name]]].save

# run netlist and simulation
xschem netlist
python3 $\{PDK_ROOT\}/$\{PDK\}/libs.tech/xschem/sg13g2_tests/ngspice_parallel_mc.py [file tail [xschem get current_name]]
"}
C {code_shown.sym} -900 -530 0 0 {name=MC_SETTINGS
only_toplevel=false
value="
**nr_workers=1
**nr_mc_sims=100

**results_plot_begin
**VTH_H(V)
**VTH_L(V)
**Hes(mV)
**Delay(mS)
**results_plot_end
"
}
C {lab_pin.sym} -1140 -760 0 1 {name=p3 sig_type=std_logic lab=I_Bais}
C {code_shown.sym} -1760 -849.0983898104131 0 0 {name=s1 only_toplevel=false 
value="
.include Tran_TB_MC.save
.save all
.control
	tran 0.75u 23m

meas tran T_L when F_RST = 0.8 fall=1
meas tran VTH_L(V) FIND VCORE AT=T_L

meas tran T_L2 when RST = 0.8 fall=1
meas tran VTH_L2(V) FIND VCORE AT=T_L

meas tran T_H when F_RST = 0.4 rise=1
meas tran VTH_H(V) FIND VCORE AT=T_H

meas tran T1 when F_RST = 0.4 rise=1
meas tran T2 when RST = 0.4 rise=1
let Delay(mS) = (T2-T1)*1000

meas tran IQ FIND i(vmeas) AT=10m

let Hes(mV) = (VTH_H(V)-VTH_L(V))*1000
print Hes

write Tran_TB_MC.raw

echo results_save_begin
print VTH_H(V)
print VTH_L(V)
print Hes(mV)
print Delay(mS)
echo results_save_end

.endc
"
}
