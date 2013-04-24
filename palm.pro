TARGET = qpalm
TEMPLATE = lib
CONFIG += plugin freetype

QTDIR_build:DESTDIR = $$QT_BUILD_TREE/plugins/platforms

CONFIG += link_pkgconfig
PKGCONFIG += glib-2.0 freetype2

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

qemu* {
    SOURCES += fb_base/fb_base.cpp \
               linuxfb/qlinuxfbintegration.cpp \
               emulatorfbintegration.cpp
    HEADERS += fb_base/fb_base.h \
               linuxfb/qlinuxfbintegration.h \
               emulatorfbintegration.h

    LIBS_PRIVATE += -lnyx
} else {
    QT += opengles2
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


INCLUDEPATH += clipboards
SOURCES += clipboards/qwebosclipboard.cpp
HEADERS += clipboards/qwebosclipboard.h

INCLUDEPATH += $$QT_BUILD_TREE/include
INCLUDEPATH += $$QT_BUILD_TREE/include/QtOpenGL
INCLUDEPATH += $$QT_BUILD_TREE/include/QtGui
INCLUDEPATH += $$QT_BUILD_TREE/include/QtCore

include($$QT_SOURCE_TREE/src/plugins/platforms/fontdatabases/basicunix/basicunix.pri)

QMAKE_CXXFLAGS += $$QT_CFLAGS_GLIB
LIBS_PRIVATE +=$$QT_LIBS_GLIB
target.path += $$[QT_INSTALL_PLUGINS]/platforms
INSTALLS += target
