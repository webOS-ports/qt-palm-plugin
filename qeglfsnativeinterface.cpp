/**
 *  Copyright (c) 2012 Hewlett-Packard Development Company, L.P.
 *                2013 Simon Busch <morphis@gravedo.de>
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

#include "qeglfsnativeinterface.h"

#include <QtGui/private/qapplication_p.h>
#include <QDebug>

QEglFSNativeInterface::QEglFSNativeInterface(QEglFSScreen *screen)
    : m_screen(screen)
{
    qDebug() << __PRETTY_FUNCTION__;
}

void* QEglFSNativeInterface::nativeResourceForWidget(const QByteArray &resourceString, QWidget *widget)
{
    QByteArray lowerCaseResource = resourceString.toLower();

    qDebug() << __PRETTY_FUNCTION__;

    if (lowerCaseResource == "display" && m_screen)
        return m_screen->display();

    return NULL;
}
