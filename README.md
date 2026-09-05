**SG13CMOS5L\_LPSVS**  
   
 Low-Power Voltage Supervisor (LPSVS) for 1.2 V core supply monitoring, integrating Power-On Reset (POR), Brown-Out Reset (BOR), hysteresis-based voltage detection, and reset-delay functionality.  
\*\*\*\*LPVSV Block Description: \*\*\*\*  
**Analog/ Mixed Signal IP Block**  
   
 **Low Power**   **Voltage Supervisor (*LPVSV*)** that monitors the ***1V2*** regulated supply generated ( ***VCORE***) by the on-chip   ***LDO***. The supervisor  \*\*\*LPVSV \*\*\*ensures reliable startup and operation of the digital core by generating Power-On reset (  ***POR***) and Brown-Out Reset (  ***BOR***) signals whenever the regulated outside its safe operating range.  
   
 The \*\*\*LPVSV \*\*\*assert  \*\*\*RESET \*\*\*during startup until the  \*\*\*1V2 \*\*\*reaches its normal value and remain stable for a predefine delay. During normal operation, if the  ***1V2***drops below the brown out threshold due to an  \*\*\*LDO \*\*\*failure, overload or supply disturbance, the  ***LPVSV immediately deasserts  RESET to protect the digital core.***  
*** ***  
  
**Target Specifications**  
Since the ***LDO*** output specification is **1.2 V ±10%**, the ***LPVSV*** thresholds should be based on that.  


| **Pin Name** | **Direction** | **Type** | **Description** |
| - | - | - | - |
| VDD | Power | Supply | Positive supply voltage |
| VSS | Power | Ground | Ground reference |
| VCORE | Input | Analog Input | LDO output voltage |
| I\_REF | Input | Analog Reference | External current reference |
| EN | Input | Digital Enable | Active-Low enable signal |
| RESET | Output | Digital Output | Active-Low Reset |
| F\_RST | Output | Digital Output | Fast reset signal ***for test*** |
| V\_Th | Output | Analog Output | Threshold value ***for test*** |


Monte Carlo & PVT Corners Simulation:

### DC Tests:

### Monte Carlo 1000 runs:

|  | VTH\_H (V) | VTH\_L (V) | Hes (mV) | IQ(uA) |
| :-: | :-: | :-: | :-: | :-: |
| **Mean** | 1.078 | 1.0136 | 64.46 | 6.29 |
| **Min** | 1.032 | 0.967 | 51.74 | 6.21 |
| **Max** | 1.124 | 1.055 | 77.18 | 6.38 |
| **STD** | 0.0151 | 0.0153 | 4.23 | 0.028 |
| **±3segma %** | 4.2 | 4.5 | 19.7 | 1.34 |

### PVT Corners :


### Transient Tests

### Monte Carlo 100 runs:

|  | VTH\_H (V) | VTH\_L (V) | Mes (mV) |
| :-: | :-: | :-: | :-: |
| **Mean** | 1.078 | 1.013 | 65.13 |
| **Min** | 1.023 | 0.959 | 63.7 |
| **Max** | 1.133 | 1.067 | 66.6 |
| **STD** | 0.0182 | 0.0179 | 0.47 |
| **±3segma %** | 5.06 | 5.3 | 2.18 |

