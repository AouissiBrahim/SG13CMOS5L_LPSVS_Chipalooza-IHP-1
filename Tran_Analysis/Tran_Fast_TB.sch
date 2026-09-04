v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 -830 -760 -30 -360 {flags=graph
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x2=0.03
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
color="4 5 4"
node="rst
f_rst
vcore"
legend=1
x1=0}
N -1270 -740 -1270 -720 {lab=VDD}
N -970 -660 -970 -640 {lab=I_Bais}
N -970 -740 -970 -720 {lab=VDD}
N -1270 -660 -1270 -640 {lab=0}
N -1270 -570 -1270 -550 {lab=VCORE}
N -1270 -490 -1270 -470 {lab=0}
N -1040 -280 -1040 -270 {lab=VSS}
N -1110 -740 -1110 -720 {lab=VSS}
N -1110 -660 -1110 -640 {lab=0}
C {simulator_commands_shown.sym} -1740 -780 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.include sg13cmos5l_stdcell.spice
"
      }
C {/foss/designs/LPSVS/LPVSV.sym} -1010 -320 0 0 {name=x1}
C {isource.sym} -970 -690 0 0 {name=I0 value=1u}
C {vsource.sym} -1270 -690 0 0 {name=V1 value=3.3 savecurrent=false}
C {lab_pin.sym} -1270 -740 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -970 -740 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {gnd.sym} -1270 -640 0 0 {name=l2 lab=0}
C {lab_pin.sym} -970 -640 0 0 {name=p3 sig_type=std_logic lab=I_Bais}
C {lab_pin.sym} -1030 -420 0 1 {name=p4 sig_type=std_logic lab=I_Bais}
C {lab_pin.sym} -1100 -420 0 1 {name=p5 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -1270 -570 0 0 {name=p6 sig_type=std_logic lab=VCORE}
C {gnd.sym} -1270 -470 0 0 {name=l3 lab=0}
C {lab_pin.sym} -1180 -350 0 0 {name=p7 sig_type=std_logic lab=VCORE}
C {lab_pin.sym} -950 -370 2 0 {name=p8 sig_type=std_logic lab=RST}
C {lab_pin.sym} -950 -340 2 0 {name=p9 sig_type=std_logic lab=F_RST}
C {code_shown.sym} -1740 -650 0 0 {name=s1 only_toplevel=false 
value="

.include Tran_TB_MC.save
.save all
.control
	tran 1n 5u
	plot RST F_RST VCORE
	plot i(v3)


meas tran TL_1 when RST = 0.8 fall=1
meas tran TL_2 when F_RST = 0.8 fall=1

let Delay(uS) = (TL_2-TL_1)*1000000
print Delay(uS)

write Tran_Fast_TB.raw
.endc
"
}
C {vsource.sym} -1270 -520 0 0 {name=V2 value="pulse(1.3 0 2u 0.01u 0.01u 5u 10u)" savecurrent=false
}
C {vsource.sym} -1110 -690 0 0 {name=V3 value=0 savecurrent=false}
C {lab_pin.sym} -1110 -740 0 0 {name=p14 sig_type=std_logic lab=VSS}
C {gnd.sym} -1110 -640 0 0 {name=l1 lab=0}
C {lab_pin.sym} -1040 -270 0 1 {name=p10 sig_type=std_logic lab=VSS}
