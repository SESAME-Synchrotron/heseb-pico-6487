TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = KeithleyPicoammeter
# KeithleyPicoammeter.dbd will be created and installed
DBD += KeithleyPicoammeter.dbd

# KeithleyPicoammeter.dbd will be made up from these files:
KeithleyPicoammeter_DBD += base.dbd

# Include dbd files from all support applications:
#KeithleyPicoammeter_DBD += xxx.dbd
KeithleyPicoammeter_DBD += sCalcoutRecord.dbd
KeithleyPicoammeter_DBD += asyn.dbd
KeithleyPicoammeter_DBD += drvAsynIPPort.dbd
KeithleyPicoammeter_DBD += drvAsynSerialPort.dbd
KeithleyPicoammeter_DBD += stream.dbd
KeithleyPicoammeter_DBD += transformRecord.dbd


# Add all the support libraries needed by this IOC
#KeithleyPicoammeter_LIBS += xxx
KeithleyPicoammeter_LIBS += stream
KeithleyPicoammeter_LIBS += asyn
KeithleyPicoammeter_LIBS += devIocStats
KeithleyPicoammeter_LIBS += calc

# KeithleyPicoammeter_registerRecordDeviceDriver.cpp derives from KeithleyPicoammeter.dbd
KeithleyPicoammeter_SRCS += KeithleyPicoammeter_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
KeithleyPicoammeter_SRCS_DEFAULT += KeithleyPicoammeterMain.cpp
KeithleyPicoammeter_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#KeithleyPicoammeter_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
KeithleyPicoammeter_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

