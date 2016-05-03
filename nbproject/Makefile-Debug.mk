#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux
CND_DLIB_EXT=so
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/main.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=-larmadillo -lpthread
CXXFLAGS=-larmadillo -lpthread

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=/mnt/seagate_1TB/Development/Robotkar_reboot/CalculatorLibrary/dist/Debug/GNU-Linux/libcalculatorlibrary.a /mnt/seagate_1TB/Development/Robotkar_reboot/RoboticArmPartLibrary/dist/Debug/GNU-Linux/libroboticarmpartlibrary.a

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/calculatorlibrarytest

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/calculatorlibrarytest: /mnt/seagate_1TB/Development/Robotkar_reboot/CalculatorLibrary/dist/Debug/GNU-Linux/libcalculatorlibrary.a

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/calculatorlibrarytest: /mnt/seagate_1TB/Development/Robotkar_reboot/RoboticArmPartLibrary/dist/Debug/GNU-Linux/libroboticarmpartlibrary.a

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/calculatorlibrarytest: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.cc} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/calculatorlibrarytest ${OBJECTFILES} ${LDLIBSOPTIONS}

${OBJECTDIR}/main.o: main.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -std=c++11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/main.o main.cpp

# Subprojects
.build-subprojects:
	cd /mnt/seagate_1TB/Development/Robotkar_reboot/CalculatorLibrary && ${MAKE}  -f Makefile CONF=Debug
	cd /mnt/seagate_1TB/Development/Robotkar_reboot/RoboticArmPartLibrary && ${MAKE}  -f Makefile CONF=Debug

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/calculatorlibrarytest

# Subprojects
.clean-subprojects:
	cd /mnt/seagate_1TB/Development/Robotkar_reboot/CalculatorLibrary && ${MAKE}  -f Makefile CONF=Debug clean
	cd /mnt/seagate_1TB/Development/Robotkar_reboot/RoboticArmPartLibrary && ${MAKE}  -f Makefile CONF=Debug clean

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
