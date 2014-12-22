/*
 * Copyright 2014 Canonical Ltd.
 *
 * This file is part of webbrowser-app.
 *
 * webbrowser-app is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * webbrowser-app is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.0
import Ubuntu.Components 1.1
import Ubuntu.Components.Popups 1.0
import Ubuntu.Content 0.1

import Ubuntu.Components.ListItems 0.1 as ListItem

Popover {
    id: popover
    property var popupModel: model
    Rectangle {
        anchors.fill: parent
        color: Theme.palette.normal.base
    }
    Column {
        anchors {
            left: parent.left
            top: parent.top
            right: parent.right
        }
        ListView {
            width: parent.width
            height: units.gu(32)
            model: popupModel.items
            delegate: ListItem.Standard {
                Label {
                    text: model.text
                    color: model.selected ? UbuntuColors.orange : UbuntuColors.coolGrey
                    anchors.centerIn: parent
                }
                onClicked: {
                    popupModel.items.select(index)
                    popupModel.accept();
                }
            }
        }
    }
    Component.onCompleted: show()
}

