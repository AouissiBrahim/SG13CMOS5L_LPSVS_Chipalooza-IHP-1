v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 0 -150 0 -100 {lab=VDD}
N -0 30 -0 80 {lab=#net1}
N 40 30 140 30 {lab=#net2}
N 40 0 40 30 {lab=#net2}
N 0 -0 40 -0 {lab=#net2}
N 180 30 180 80 {lab=VSS}
N 180 -150 180 -100 {lab=VDD}
N 220 -100 220 -70 {lab=#net3}
N 180 -70 220 -70 {lab=#net3}
N 380 -150 380 -100 {lab=VDD}
N 380 -70 380 -30 {lab=OUT}
N 380 10 410 10 {lab=VSS}
N 380 10 380 80 {lab=VSS}
N 350 10 380 10 {lab=VSS}
N 180 -150 380 -150 {lab=VDD}
N 180 -10 180 -0 {lab=#net4}
N 180 80 380 80 {lab=VSS}
N 130 80 180 80 {lab=VSS}
N -200 30 -200 80 {lab=#net1}
N -0 80 70 80 {lab=#net1}
N -200 80 -0 80 {lab=#net1}
N -270 30 -240 30 {lab=IN}
N -0 -70 0 -0 {lab=#net2}
N -200 -150 -200 -100 {lab=VDD}
N 0 -150 180 -150 {lab=VDD}
N -200 -150 0 -150 {lab=VDD}
N -200 -70 -200 -0 {lab=#net5}
N -200 -70 -160 -70 {lab=#net5}
N -160 -100 -160 -70 {lab=#net5}
N -160 -100 -40 -100 {lab=#net5}
N 220 -100 340 -100 {lab=#net3}
C {sg13g2_pr/sg13_lv_nmos.sym} 20 30 0 1 {name=M4
l=0.5u
w=1u
ng=1
m=10
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 160 30 0 0 {name=M5
l=0.5u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 200 -100 0 1 {name=M6
l=0.5u
w=1u
ng=1
m=10
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 360 -100 0 0 {name=M7
l=0.5u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} 380 -150 0 0 {name=p1 lab=VDD}
C {iopin.sym} 380 -50 0 0 {name=p2 lab=OUT}
C {iopin.sym} 290 80 1 0 {name=p3 lab=VSS}
C {sg13g2_pr/sg13_lv_pmos.sym} 380 -10 3 1 {name=M8
l=10u
w=10u
ng=1
m=4
model=sg13_lv_pmos
spiceprefix=X
}
C {ammeter.sym} 180 -40 0 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {ammeter.sym} 100 80 3 1 {name=Vmeas2 savecurrent=true spice_ignore=0}
C {sg13g2_pr/sg13_hv_nmos.sym} -220 30 0 0 {name=M10
l=10u
w=1u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {iopin.sym} -270 30 2 0 {name=p4 lab=IN}
C {sg13g2_pr/sg13_lv_pmos.sym} -20 -100 0 0 {name=M1
l=0.5u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -180 -100 0 1 {name=M2
l=0.5u
w=1u
ng=5
m=10
model=sg13_lv_pmos
spiceprefix=X
}
