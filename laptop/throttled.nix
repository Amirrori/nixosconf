"
[GENERAL]
Enabled: True
Sysfs_Power_Path: /sys/class/power_supply/AC*/online
Autoreload: True

[BATTERY]
Update_Rate_s: 30
PL1_Tdp_W: 7
PL1_Duration_s: 28
PL2_Tdp_W: 7
PL2_Duration_S: 0.002
Trip_Temp_C: 80
cTDP: 1
Disable_BDPROCHOT: False

[AC]
Update_Rate_s: 5
PL1_Tdp_W: 44
PL1_Duration_s: 28
PL2_Tdp_W: 44
PL2_Duration_S: 0.002
Trip_Temp_C: 95
cTDP: 2
Disable_BDPROCHOT: False

[UNDERVOLT.BATTERY]
CORE: -100
GPU: -80
CACHE: -100
UNCORE: -80
ANALOGIO: 0

[UNDERVOLT.AC]
CORE: -100
GPU: -80
CACHE: -100
UNCORE: -80
ANALOGIO: 0
"

