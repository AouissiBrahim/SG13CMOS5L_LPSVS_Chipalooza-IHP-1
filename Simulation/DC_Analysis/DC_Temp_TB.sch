v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 -1310 -690 -510 -290 {flags=graph
y1=-0.19
y2=1.5
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1.3
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
color="4 7"
node="RST
VCORE"}
N -1030 -210 -1030 -180 {lab=VCORE}
N -1110 -210 -1110 -180 {lab=VDD}
N -1210 -210 -1210 -180 {lab=VSS}
N -590 -190 -540 -190 {lab=Rst}
N -590 -160 -540 -160 {lab=F_Rst}
N -1320 -210 -1320 -140 {lab=VDD}
N -1320 -80 -1320 -60 {lab=I_B}
C {code_shown.sym} -1790 -469.0983898104131 0 0 {name=s2 only_toplevel=false 
value="
.include DC_Temp_TB.save
.save all
.control

dc Vin 0 1.3 0.01 temp -40 125 15
write DC_Temp_TB.raw

.endc
"
}
C {lab_pin.sym} -1030 -210 0 1 {name=p11 sig_type=std_logic lab=VCORE}
C {gnd.sym} -1030 -120 0 0 {name=l9 lab=GND}
C {vsource.sym} -1110 -150 0 0 {name=VDD value=3.3
savecurrent=false
}
C {lab_pin.sym} -1110 -210 0 0 {name=p16 sig_type=std_logic lab=VDD}
C {gnd.sym} -1110 -120 0 0 {name=l6 lab=GND}
C {lab_pin.sym} -540 -190 0 1 {name=p7 sig_type=std_logic lab=Rst}
C {code.sym} -1790 -260 0 0 {name=NGSPICE only_toplevel=true 
value="
.options rshunt = 1e15
.options gmin=1e-9
.options reltol = 0.01 abstol = 1p
.option filetype=ascii
"
           
}
C {lab_pin.sym} -740 -240 1 0 {name=p1 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -820 -170 0 0 {name=p2 sig_type=std_logic lab=VCORE}
C {lab_pin.sym} -670 -240 1 0 {name=p3 sig_type=std_logic lab=I_B}
C {vsource.sym} -1210 -150 0 0 {name=VSS value=0
savecurrent=false
}
C {lab_pin.sym} -1210 -210 0 0 {name=p4 sig_type=std_logic lab=VSS}
C {gnd.sym} -1210 -120 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -680 -100 3 0 {name=p5 sig_type=std_logic lab=VSS}
C {vsource.sym} -1030 -150 0 0 {name=Vin value=1.2
}
C {lab_pin.sym} -540 -160 0 1 {name=p6 sig_type=std_logic lab=F_Rst}
C {isource.sym} -1320 -110 0 0 {name=I0 value=1u}
C {lab_pin.sym} -1320 -210 2 0 {name=p12 sig_type=std_logic lab=VDD}
C {/foss/designs/LPSVS/LPVSV.sym} -650 -140 0 0 {name=x1}
C {simulator_commands_shown.sym} -1780 -640 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerDIO.lib dio_tt
.include sg13cmos5l_stdcell.spice
"
      }
C {lab_pin.sym} -1320 -60 0 0 {name=p9 sig_type=std_logic lab=I_B}
C {launcher.sym} -1710 -110 0 0 {name=h2
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
C {devices/launcher.sym} -1710 -70 0 0 {name=h5
descr="load waves Ctrl + left click" 
tclcommand="xschem raw_read $netlist_dir/DC_Temp_TB.raw dc"
}
