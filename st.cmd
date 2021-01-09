#!../../bin/linux-x86_64/JDQ016

#- You may have to change JDQ016 to something else
#- everywhere it appears in this file

< envPaths

epicsEnvSet "P" "HALF:BD:"
epicsEnvSet "R" "IO:"
epicsEnvSet("ETHER","192.168.1.18:50000")

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/JDQ016.dbd"
JDQ016_registerRecordDeviceDriver pdbbase

epicsEnvSet "STREAM_PROTOCOL_PATH" "$(TOP)/db"

# Set up ASYN ports
#vxi11Configure("L0", "$(ETHER)", 0, 0.0, "inst0", 0)
drvAsynIPPortConfigure("L0", "$(ETHER)", 0, 0, 0)

## Load record instances
#dbLoadRecords("db/xxx.db","user=ioc")
dbLoadTemplate "db/bo.substitutions"
#dbLoadRecords("db/devJDQ016.db","P=$(P),R=$(R),PORT=L0,A=0")

cd "${TOP}/iocBoot/${IOC}"
iocInit

#var streamDebug 1
## Start any sequence programs
#seq sncxxx,"user=ioc"
