// Copyright (c) 2021 Ultimaker B.V.
// Cura is released under the terms of the LGPLv3 or higher.

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.1

import UM 1.6 as UM
import Cura 1.6 as Cura

Rectangle
{
    property var packageData

    width: parent.width
    height: childrenRect.height + UM.Theme.getSize("default_margin").height * 2

    color: UM.Theme.getColor("main_background")
    radius: UM.Theme.getSize("default_radius").width

    RowLayout
    {
        width: parent.width - UM.Theme.getSize("default_margin").width * 2
        height: childrenRect.height
        x: UM.Theme.getSize("default_margin").width
        y: UM.Theme.getSize("default_margin").height

        spacing: UM.Theme.getSize("default_margin").width

        Image //Separate column for icon on the left.
        {
            Layout.preferredWidth: UM.Theme.getSize("card_icon").width
            Layout.preferredHeight: UM.Theme.getSize("card_icon").height

            source: packageData.iconUrl != "" ? packageData.iconUrl : "../images/placeholder.svg"
        }

        Column
        {
            Layout.fillWidth: true
            Layout.preferredHeight: childrenRect.height

            spacing: UM.Theme.getSize("default_margin").height

            RowLayout //Title row.
            {
                width: parent.width

                spacing: UM.Theme.getSize("default_margin").width

                Label
                {
                    font: UM.Theme.getFont("medium_bold")
                    color: UM.Theme.getColor("text")

                    text: packageData.displayName
                }

                UM.RecolorImage
                {
                    Layout.preferredWidth: visible ? UM.Theme.getSize("section_icon").width : 0
                    Layout.preferredHeight: visible ? UM.Theme.getSize("section_icon").height : 0

                    color: UM.Theme.getColor("icon")
                    visible: packageData.isVerified
                    source: UM.Theme.getIcon("CheckCircle")

                    // TODO: on hover
                }

                Rectangle
                {   // placeholder for 'certified material' icon+link whenever we implement the materials part of this card
                    Layout.preferredWidth: visible ? UM.Theme.getSize("section_icon").width : 0
                    Layout.preferredHeight: visible ? UM.Theme.getSize("section_icon").height : 0

                    // TODO: on hover
                }

                Label
                {
                    Layout.fillWidth: true

                    text: packageData.packageVersion
                }

                UM.RecolorImage
                {
                    Layout.preferredWidth: UM.Theme.getSize("section_icon").width
                    Layout.preferredHeight: UM.Theme.getSize("section_icon").height

                    color: UM.Theme.getColor("icon")
                    source: UM.Theme.getIcon("Link")

                    // TODO: on clicked url
                }
            }

            Label
            {
                width: parent.width

                maximumLineCount: 2
                text: packageData.description
                elide: Text.ElideRight //TODO: Make space for Read More button.
            }
            /*Cura.TertiaryButton
            {
                //TODO: Inline in description.

                visible: descriptionLabel.text.length > parent.charLimitSmall
                text: catalog.i18nc("@info", "Read more")

                // TODO: overlaps elided text, is this ok?
            }*/

            RowLayout //Author and action buttons.
            {
                width: parent.width

                Label
                {
                    text: catalog.i18nc("@label", "By")
                }

                Cura.TertiaryButton
                {
                    Layout.fillWidth: true

                    text: packageData.authorName

                    // TODO on clicked (is link) -> MouseArea?
                }

                Cura.SecondaryButton
                {
                    text: catalog.i18nc("@button", "Disable")
                    // not functional right now
                }

                Cura.SecondaryButton
                {
                    text: catalog.i18nc("@button", "Uninstall")
                    // not functional right now
                }

                Cura.PrimaryButton
                {
                    text: catalog.i18nc("@button", "Update")
                    // not functional right now
                }
            }
        }
    }
}
