TARGET = qpalm
TEMPLATE = lib
CONFIG += plugin $$(WEBOS_CONFIG)

QTDIR_build:DESTDIR = $$QT_BUILD_TREE/plugins/platforms

SOURCES = main.cpp \
          hiddtp_qpa.cpp \
          NyxInputControl.cpp \
          nyxkeyboardhandler.cpp

HEADERS += hidd_qpa.h \
           hiddtp_qpa.h \
           InputControl.h \
           NyxInputControl.h \
           nyxkeyboardhandler.h \
           FlickGesture.h \
           ScreenEdgeFlickGesture.h \
           qgenericunixfontdatabase.h

webos {
    qemu* {
        SOURCES += fb_base/fb_base.cpp \
                   linuxfb/qlinuxfbintegration.cpp \
                   emulatorfbintegration.cpp
        HEADERS += fb_base/fb_base.h \
                   linuxfb/qlinuxfbintegration.h \
                   emulatorfbintegration.h

        LIBS_PRIVATE += -lnyx
    } else {
        QT += opengl
        SOURCES += qeglfsintegration.cpp \
                   eglconvenience/qeglconvenience.cpp \
                   eglconvenience/qeglplatformcontext.cpp \
                   qeglfswindow.cpp \
                   qeglfswindowsurface.cpp \
                   qeglfsscreen.cpp \
                   qeglfsnativeinterface.cpp

        HEADERS += qeglfsintegration.h \
                   eglconvenience/qeglconvenience.h \
                   eglconvenience/qeglplatformcontext.h \
                   qeglfswindow.h \
                   qeglfswindowsurface.h \
                   qeglfsscreen.h \
                   qeglfsnativeinterface.h
        DEFINES += TARGET_DEVICE
        LIBS_PRIVATE += -lnyx -ldl
    }
}


INCLUDEPATH += clipboards
SOURCES += clipboards/qwebosclipboard.cpp
HEADERS += clipboards/qwebosclipboard.h

include($$QT_SOURCE_TREE/src/plugins/fontdatabases/basicunix/basicunix.pri)

QMAKE_CXXFLAGS += $$QT_CFLAGS_GLIB
LIBS_PRIVATE +=$$QT_LIBS_GLIB
target.path += $$[QT_INSTALL_PLUGINS]/platforms
INSTALLS += target
