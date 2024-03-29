/****************************************************************************
**
** Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies).
** Copyright (C) 2012 Hewlett-Packard Development Company, L.P.
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the plugins of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** GNU Lesser General Public License Usage
** This file may be used under the terms of the GNU Lesser General Public
** License version 2.1 as published by the Free Software Foundation and
** appearing in the file LICENSE.LGPL included in the packaging of this
** file. Please review the following information to ensure the GNU Lesser
** General Public License version 2.1 requirements will be met:
** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Nokia gives you certain additional
** rights. These rights are described in the Nokia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU General
** Public License version 3.0 as published by the Free Software Foundation
** and appearing in the file LICENSE.GPL included in the packaging of this
** file. Please review the following information to ensure the GNU General
** Public License version 3.0 requirements will be met:
** http://www.gnu.org/copyleft/gpl.html.
**
** Other Usage
** Alternatively, this file may be used in accordance with the terms and
** conditions contained in a signed written agreement between you and Nokia.
**
**
**
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

#ifndef EGLINTEGRATION_H
#define EGLINTEGRATION_H

#include "qeglfsscreen.h"

#include "hiddtp_qpa.h"
#include "nyxkeyboardhandler.h"

#include "qwebosclipboard.h"
#include <QtGui/QPlatformIntegration>
#include <QtGui/QPlatformScreen>

#include "qeglfsnativeinterface.h"

QT_BEGIN_HEADER

QT_BEGIN_NAMESPACE

class QEglFSIntegration : public QPlatformIntegration
{
public:
    QEglFSIntegration(bool soft);
    bool hasCapability(QPlatformIntegration::Capability cap) const;
    QPixmapData *createPixmapData(QPixmapData::PixelType type) const;
    QPlatformWindow *createPlatformWindow(QWidget *widget, WId winId) const;
    QWindowSurface *createWindowSurface(QWidget *widget, WId winId) const;

    QList<QPlatformScreen *> screens() const { return mScreens; }

    QPlatformFontDatabase *fontDatabase() const;
    virtual QPlatformClipboard *clipboard() const;
    virtual QPlatformNativeInterface* nativeInterface() const;

private:
    QPlatformFontDatabase *mFontDb;
    QList<QPlatformScreen *> mScreens;
    QEglFSScreen *m_primaryScreen;
    QEglFSNativeInterface *m_nativeInterface;

    QPAHiddTpHandler* m_tpHandler;
    NyxKeyboardHandler* m_keyboard;

    bool soft;
    QWebOSClipboard* m_clipboard;
};

QT_END_NAMESPACE
QT_END_HEADER

#endif
