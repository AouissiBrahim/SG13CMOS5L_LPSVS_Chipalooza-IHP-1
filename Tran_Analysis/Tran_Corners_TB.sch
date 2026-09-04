v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -1270 -790 -1270 -770 {lab=VDD}
N -970 -710 -970 -690 {lab=I_Bais}
N -970 -790 -970 -770 {lab=VDD}
N -1270 -710 -1270 -690 {lab=0}
N -1270 -620 -1270 -600 {lab=VCORE}
N -1270 -540 -1270 -520 {lab=0}
N -1110 -790 -1110 -770 {lab=VSS}
N -1110 -710 -1110 -690 {lab=0}
C {simulator_commands_shown.sym} -2000 -850 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOSlv.lib mos_ss
.lib cornerMOShv.lib mos_ss
.include sg13cmos5l_stdcell.spice
"
      }
C {/foss/designs/LPSVS/LPVSV.sym} -1010 -230 0 0 {name=x1}
C {isource.sym} -970 -740 0 0 {name=I0 value=\{IBais\}}
C {vsource.sym} -1270 -740 0 0 {name=V1 value=\{VDD\} savecurrent=false}
C {lab_pin.sym} -1270 -790 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -970 -790 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {gnd.sym} -1270 -690 0 0 {name=l2 lab=0}
C {lab_pin.sym} -970 -690 0 0 {name=p3 sig_type=std_logic lab=I_Bais}
C {lab_pin.sym} -1030 -330 0 1 {name=p4 sig_type=std_logic lab=I_Bais}
C {lab_pin.sym} -1100 -330 0 1 {name=p5 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -1270 -620 0 0 {name=p6 sig_type=std_logic lab=VCORE}
C {gnd.sym} -1270 -520 0 0 {name=l3 lab=0}
C {lab_pin.sym} -1180 -260 0 0 {name=p7 sig_type=std_logic lab=VCORE}
C {lab_pin.sym} -950 -280 2 0 {name=p8 sig_type=std_logic lab=RST}
C {lab_pin.sym} -950 -250 2 0 {name=p9 sig_type=std_logic lab=F_RST}
C {code_shown.sym} -1990 -709.0983898104131 0 0 {name=s1 only_toplevel=false 
value="
.options temp = 125
.include Tran_Corners_TB.save
.param VDD = 3.3
.param IBais = 1u
.save all
.control

alterparam VDD=3.6 
alterparam IBais = 1.02u
reset
tran 0.4u 27m

	meas tran T_H when F_RST = 0.4 rise=1
	meas tran VTH_H(V) FIND VCORE AT=T_H

	meas tran T_L when F_RST = 0.8 fall=1
	meas tran VTH_L(V) FIND VCORE AT=T_L

	let Hes(mV) = (VTH_H(V)-VTH_L(V))*1000

	meas tran T1 when F_RST = 0.4 rise=1
	meas tran T2 when RST = 0.4 rise=1
	let Delay(mS) = (T2-T1)*1000

	meas tran IQ FIND i(v3) AT=10m

alterparam VDD=2.7 
alterparam IBais = 0.98u
reset
tran 0.4u 27m

	meas tran T_H when F_RST = 0.4 rise=1
	meas tran VTH_H(V) FIND VCORE AT=T_H

	meas tran T_L when F_RST = 0.8 fall=1
	meas tran VTH_L(V) FIND VCORE AT=T_L

	let Hes(mV) = (VTH_H(V)-VTH_L(V))*1000

	meas tran T1 when F_RST = 0.4 rise=1
	meas tran T2 when RST = 0.4 rise=1
	let Delay(mS) = (T2-T1)*1000

	meas tran IQ FIND i(v3) AT=10m

let VTH_H_3V6_1uA02 = tran1.VTH_H(V)
let VTH_H_2V7_0uA98 = tran2.VTH_H(V)

let VTH_L_3V6_1uA02 = tran1.VTH_L(V)
let VTH_L_2V7_0uA98 = tran2.VTH_L(V)

let Hes_3V6_1uA02 = tran1.Hes(mV) 
let Hes_2V7_0uA98 = tran2.Hes(mV)

let Delay_3V6_1uA02 = tran1.Delay(mS) 
let Delay_2V7_0uA98 = tran2.Delay(mS)

print VTH_H_3V6_1uA02 VTH_H_2V7_0uA98
print VTH_L_3V6_1uA02 VTH_L_2V7_0uA98

print Hes_3V6_1uA02 Hes_2V7_0uA98
print Delay_3V6_1uA02 Delay_2V7_0uA98

write Tran_Corners_TB.raw
.endc
"
}
C {vsource.sym} -1270 -570 0 0 {name=V2 value="pulse(0 1.3 1m 5m 5m 15m 26m)" savecurrent=false
}
C {vsource.sym} -1110 -740 0 0 {name=V3 value=0 savecurrent=false}
C {lab_pin.sym} -1110 -790 0 0 {name=p14 sig_type=std_logic lab=VSS}
C {gnd.sym} -1110 -690 0 0 {name=l1 lab=0}
C {lab_pin.sym} -1040 -190 0 1 {name=p10 sig_type=std_logic lab=VSS}
