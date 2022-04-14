#!../../bin/linux-x86_64/KeithleyPicoammeter

###############################################################################
# Set up environment
epicsEnvSet("P","$(P=K6487:)")
epicsEnvSet("K6487_ADDRESS","$(K6487_ADDRESS=10.1.50.19:30000)")
epicsEnvSet("K6487_PROTOCOL","$(K6487_PROTOCOL=COM)")
epicsEnvSet("STREAM_PROTOCOL_PATH", "protocol")
< envPaths
cd "${TOP}"

###############################################################################
# Register all support components
dbLoadDatabase "dbd/KeithleyPicoammeter.dbd"
KeithleyPicoammeter_registerRecordDeviceDriver pdbbase

###############################################################################
# Set up ASYN ports
# drvAsynIPPortConfigure port ipInfo priority noAutoconnect noProcessEos
drvAsynIPPortConfigure("L0","$(K6487_ADDRESS)",0,0,0)
#asynSetTraceIOMask("L0",-1,0x2)
#asynSetTraceMask("L0",-1,0x9)
#asynSetOption("L0", -1, "baud", "9600")
#asynSetOption("L0", -1, "bits", "8")
#asynSetOption("L0", -1, "parity", "N")
#asynSetOption("L0", -1, "stop", "1")
#asynSetOption("L0", -1, "crtscts", "N")

###############################################################################
# Load record instances
dbLoadRecords ("db/keithley.db" "P=$(P),R=1:,PORT=L0,NELM=1000")
dbLoadRecords ("db/asynRecord.db" "P=$(P),R=asyn,PORT=L0,ADDR=-1,OMAX=0,IMAX=0")

###############################################################################
# Start IOC
cd "${TOP}/iocBoot/${IOC}"
iocInit

