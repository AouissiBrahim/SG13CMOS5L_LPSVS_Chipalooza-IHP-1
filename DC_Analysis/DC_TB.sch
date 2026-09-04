v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -870 -650 -870 -620 {lab=VCORE}
N -950 -650 -950 -620 {lab=VDD}
N -1050 -650 -1050 -620 {lab=VSS}
N -880 -420 -830 -420 {lab=Rst}
N -880 -390 -830 -390 {lab=F_Rst}
N -1080 -280 -1080 -210 {lab=VDD}
C {code_shown.sym} -1750 -499.0983898104131 0 0 {name=s2 only_toplevel=false 
value="
.include DC_TB.save
.save all
.control

dc Vin 1.3 0 -0.01
	plot RST VCORE title 'From Heigh to Low'
	meas dc VL when RST =0.2
	meas dc IQL max i(vss)
dc Vin 0 1.3 0.01
	plot RST VCORE title 'From Low to Heigh'
	meas dc VH when RST =0.95
	meas dc IQH max i(vss)

let Hes(mV) = (dc2.VH-dc1.VL)*1000
let VTH_L = dc1.VL
let VTH_H = dc2.VH
let IQL_Max = dc1.IQl
let IQH_Max = dc2.IQH
print VTH_H VTH_L
print Hes(mV)
print IQH_Max IQL_Max
.endc
"
}
C {lab_pin.sym} -870 -650 0 1 {name=p11 sig_type=std_logic lab=VCORE}
C {gnd.sym} -870 -560 0 0 {name=l9 lab=GND}
C {vsource.sym} -950 -590 0 0 {name=VDD value=3.3
savecurrent=false
}
C {lab_pin.sym} -950 -650 0 0 {name=p16 sig_type=std_logic lab=VDD}
C {gnd.sym} -950 -560 0 0 {name=l6 lab=GND}
C {lab_pin.sym} -830 -420 0 1 {name=p7 sig_type=std_logic lab=Rst}
C {code.sym} -1360 -650 0 0 {name=NGSPICE only_toplevel=true 
value="
.options rshunt = 1e15
.options gmin=1e-9
.options reltol = 0.01 abstol = 1p
.option filetype=ascii
"
           
}
C {lab_pin.sym} -1030 -470 1 0 {name=p1 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -1110 -400 0 0 {name=p2 sig_type=std_logic lab=VCORE}
C {lab_pin.sym} -960 -470 1 0 {name=p3 sig_type=std_logic lab=I_B}
C {vsource.sym} -1050 -590 0 0 {name=VSS value=0
savecurrent=false
}
C {lab_pin.sym} -1050 -650 0 0 {name=p4 sig_type=std_logic lab=VSS}
C {gnd.sym} -1050 -560 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -970 -330 3 0 {name=p5 sig_type=std_logic lab=VSS}
C {vsource.sym} -870 -590 0 0 {name=Vin value=1.2
}
C {lab_pin.sym} -830 -390 0 1 {name=p6 sig_type=std_logic lab=F_Rst}
C {isource.sym} -1080 -180 0 0 {name=I0 value=1u}
C {lab_pin.sym} -1080 -280 2 0 {name=p12 sig_type=std_logic lab=VDD}
C {/foss/designs/LPSVS/LPVSV.sym} -940 -370 0 0 {name=x1}
C {simulator_commands_shown.sym} -1820 -660 0 0 {
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
C {lab_pin.sym} -1080 -150 3 0 {name=p9 sig_type=std_logic lab=I_B}
