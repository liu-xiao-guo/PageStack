import QtQuick 2.0
import Ubuntu.Components 1.1
import Ubuntu.Components.ListItems 1.0 as ListItem

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "pagestack.ubuntu"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(50)
    height: units.gu(75)

    PageStack {
        id: pageStack
        Component.onCompleted: {
            push(page0)
        }

        Page {
            id: page0
            title: i18n.tr("Root page")
            visible: false

            Column {
                anchors.fill: parent

                ListItem.Standard {
                    text: i18n.tr("Page one")
                    onClicked: pageStack.push(page1, {color: UbuntuColors.orange})
                    progression: true
                }
                ListItem.Standard {
                    text: i18n.tr("Page two")
                    onClicked: pageStack.push(Qt.resolvedUrl("Page2.qml"))
                    progression: true
                }
            }
        }

        Page {
            title: "Rectangle"
            id: page1
            visible: false
            property alias color: rectangle.color
            Rectangle {
                id: rectangle
                anchors {
                    fill: parent
                    margins: units.gu(5)
                }
            }
        }
    }
}

