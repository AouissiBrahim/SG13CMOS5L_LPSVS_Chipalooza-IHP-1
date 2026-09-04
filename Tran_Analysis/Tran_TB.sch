v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 -840 -860 -40 -460 {flags=graph
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x2=0.1
divx=5
subdivx=4
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=1
y2=1.3
y1=0
sim_type=tran
color="6 5 4"
node="rst
f_rst
vcore"
legend=1
x1=0}
B 2 -840 -460 -40 -60 {flags=graph
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x2=0.1
divx=5
subdivx=4
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=1
y2=40u
sim_type=tran
x1=0
color=11
node=i(v3)
legend=1
y1=0}
N -1270 -790 -1270 -770 {lab=VDD}
N -970 -710 -970 -690 {lab=I_Bais}
N -970 -790 -970 -770 {lab=VDD}
N -1270 -710 -1270 -690 {lab=0}
N -1090 -277.5 -1090 -267.5 {lab=VSS}
N -1110 -790 -1110 -770 {lab=VSS}
N -1110 -710 -1110 -690 {lab=0}
C {simulator_commands_shown.sym} -1740 -830 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.include sg13cmos5l_stdcell.spice
"
      }
C {/foss/designs/LPSVS/LPVSV.sym} -1060 -317.5 0 0 {name=x1}
C {isource.sym} -970 -740 0 0 {name=I0 value=1u}
C {vsource.sym} -1270 -740 0 0 {name=V1 value=3.3 savecurrent=false}
C {lab_pin.sym} -1270 -790 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -970 -790 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {gnd.sym} -1270 -690 0 0 {name=l2 lab=0}
C {lab_pin.sym} -970 -690 0 0 {name=p3 sig_type=std_logic lab=I_Bais}
C {lab_pin.sym} -1080 -417.5 0 1 {name=p4 sig_type=std_logic lab=I_Bais}
C {lab_pin.sym} -1150 -417.5 0 1 {name=p5 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -1670 -157.5 0 0 {name=p6 sig_type=std_logic lab=VCORE}
C {gnd.sym} -1670 -97.5 0 0 {name=l3 lab=0}
C {lab_pin.sym} -1230 -347.5 2 1 {name=p7 sig_type=std_logic lab=VCORE}
C {lab_pin.sym} -1000 -367.5 2 0 {name=p8 sig_type=std_logic lab=RST}
C {lab_pin.sym} -1000 -337.5 2 0 {name=p9 sig_type=std_logic lab=F_RST}
C {code_shown.sym} -1740 -699.0983898104131 0 0 {name=s1 only_toplevel=false 
value="
.include Tran_TB_MC.save
.save all
.control
	tran 0.5u 100m

meas tran T_H when F_RST = 0.4 rise=1
meas tran VTH_H(V) FIND VCORE AT=T_H

meas tran T_L when F_RST = 0.8 fall=1
meas tran VTH_L(V) FIND VCORE AT=T_L

meas tran T1 when F_RST = 0.4 rise=1
meas tran T2 when RST = 0.4 rise=1
let Delay(mS) = (T2-T1)*1000

meas tran IQ FIND i(vmeas) AT=10m

let Hes(mV) = (VTH_H(V)-VTH_L(V))*1000
print Hes


print VTH_H(V)
print VTH_L(V)
print Hes(mV)
print Delay(mS)

write Tran_TB.raw
.endc
"
}
C {vsource.sym} -1110 -740 0 0 {name=V3 value=0 savecurrent=false}
C {lab_pin.sym} -1110 -790 0 0 {name=p14 sig_type=std_logic lab=VSS}
C {gnd.sym} -1110 -690 0 0 {name=l1 lab=0}
C {lab_pin.sym} -1090 -267.5 0 1 {name=p10 sig_type=std_logic lab=VSS}
C {vsource.sym} -1670 -127.5 0 0 {name=Vin4 value="pwl(0 0 10m 1.2 20m 1.2 20.1m 0.9 20.2m 1.2 30m 1.2 40m 0.7 50m 0.7 50.1m 1.2 55m 1.2 55.1m 0.7 60m 0.7 61m 0 70m 0 70.1m 1.2 70.2m 0 80m 0 100m 1)"
savecurrent=false
}
C {devices/launcher.sym} -1200 -597.5 0 0 {name=h5
descr="load waves Ctrl + left click" 
tclcommand="xschem raw_read $netlist_dir/Tran_TB.raw tran"
}
C {launcher.sym} -1200 -547.5 0 0 {name=h2
descr=SimulateNGSPICE
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

# run netlist and simulation
xschem netlist
simulate
"}
