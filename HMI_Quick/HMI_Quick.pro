QT += quick

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

#DEPENDPATH += . ../sensor-libraries/bme280
#INCLUDEPATH += . ../sensor-libraries/bme280
#QMAKE_CFLAGS += -Wall
#LIBS += \
#    -L../build-sensor-libraries-Boot2Qt-Debug/bme280 \



DEPENDPATH += . ../wiringpiqt-master/wiringPi ../wiringpiqt-master/devLib
INCLUDEPATH += . ../wiringpiqt-master/wiringPi ../wiringpiqt-master/devLib
QMAKE_CFLAGS += -Wall -Wextra
LIBS += \
    -L../build-wiringpiqt-Boot2Qt-Debug/wiringPi \
    -L../build-wiringpiqt-Boot2Qt-Debug/devLib \
    -lwiringPi \
    -lwiringPiDev


SOURCES += \
    EnvironmentalModel.cpp \
    environmentalsensor.cpp \
        main.cpp \
        lightsensor.cpp \
    generalsensor.cpp \
    bme280.cpp \
    simulatedata.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    EnvironmentalModel.h \
    environmentalsensor.h \
    generalsensor.h \
    bme280.h \
    lightsensor.h \
    simulatedata.h
