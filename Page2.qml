import QtQuick 2.0
import Ubuntu.Components 1.1

Item {
    anchors.fill: parent

    Text {
        id: text
        anchors.centerIn: parent
        text: "This is page 1"
    }

    Button {
        anchors.top: text.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: units.gu(5)
        width: units.gu(20)
        height: units.gu(8)

        text: "Jump to page 1"

        onClicked: {
            console.log("Button is clicked!")
            console.log("Current page: " + pageStack.currentPage);
            console.log("Depth of the pagestack: " + pageStack.depth);

            pageStack.pop();
        }
    }
}
