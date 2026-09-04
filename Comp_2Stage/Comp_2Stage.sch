v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -420 -120 -320 -120 {lab=#net1}
N -280 -120 -280 -60 {lab=VSS}
N -460 -120 -460 -60 {lab=VSS}
N -420 -160 -420 -120 {lab=#net1}
N -460 -160 -420 -160 {lab=#net1}
N -460 -160 -460 -150 {lab=#net1}
N -460 -250 -460 -160 {lab=#net1}
N -460 -330 -460 -310 {lab=#net2}
N -370 -330 -280 -330 {lab=#net2}
N -280 -330 -280 -310 {lab=#net2}
N -370 -280 -280 -280 {lab=VDD}
N -460 -330 -370 -330 {lab=#net2}
N -370 -320 -370 -280 {lab=VDD}
N -460 -280 -370 -280 {lab=VDD}
N -370 -360 -370 -330 {lab=#net2}
N -370 -450 -370 -390 {lab=VDD}
N -280 -220 -280 -150 {lab=#net3}
N -370 -320 -290 -320 {lab=VDD}
N -290 -450 -290 -320 {lab=VDD}
N -240 -280 -200 -280 {lab=VinP}
N -530 -280 -500 -280 {lab=VinN}
N -50 -120 -50 -60 {lab=VSS}
N -280 -60 -50 -60 {lab=VSS}
N -50 -450 -50 -390 {lab=VDD}
N -290 -450 -50 -450 {lab=VDD}
N -410 -430 -410 -390 {lab=VBais}
N -410 -430 -90 -430 {lab=VBais}
N -90 -430 -90 -390 {lab=VBais}
N -140 -120 -90 -120 {lab=#net3}
N -280 -220 -140 -220 {lab=#net3}
N -280 -250 -280 -220 {lab=#net3}
N -370 -450 -290 -450 {lab=VDD}
N -460 -60 -280 -60 {lab=VSS}
N -140 -220 -140 -120 {lab=#net3}
N -50 -360 -50 -150 {lab=VOUT}
C {sg13g2_pr/sg13_hv_nmos.sym} -440 -120 0 1 {name=M3
l=10u
w=5u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -480 -280 0 0 {name=M1
l=2u
w=20u
ng=2
m=2
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -260 -280 0 1 {name=M2
l=2u
w=20u
ng=2
m=2
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -300 -120 0 0 {name=M4
l=10u
w=5u
ng=1
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -390 -390 0 0 {name=M5
l=1u
w=5u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {iopin.sym} -370 -450 0 1 {name=p4 lab=VDD}
C {iopin.sym} -410 -390 0 1 {name=p5 lab=VBais}
C {iopin.sym} -200 -280 3 1 {name=p7 lab=VinP}
C {iopin.sym} -530 -280 3 0 {name=p9 lab=VinN}
C {iopin.sym} -50 -270 0 0 {name=p11 lab=VOUT}
C {iopin.sym} -460 -60 2 0 {name=p22 lab=VSS}
C {sg13g2_pr/sg13_hv_pmos.sym} -70 -390 0 0 {name=M6
l=1u
w=5u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -70 -120 0 0 {name=M7
l=10u
w=5u
ng=1
m=4
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/annotate_fet_params.sym} -670 -440 0 0 {name=annot1 ref=M6}
