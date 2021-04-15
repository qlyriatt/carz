import QtQuick 2.15
import QtQuick.Controls 2.15


Item {
	width: 360
	height: 616 - 56
	
	Rectangle {
		width: parent.width
		height: parent.height
		opacity: 0.5
		color: "#000000"	
	}
	
	Rectangle {
		id: innerPageRectangle
		radius: 10
		border.width: 2
		//border.color: Material.color(Material.Grey)
		anchors.fill: parent
		anchors.topMargin: 20
		anchors.rightMargin: 20
		anchors.leftMargin: 20
		anchors.bottomMargin: 20
		
		Button {
			anchors.bottom: parent.bottom
			anchors.bottomMargin: 30
			anchors.horizontalCenter: parent.horizontalCenter
			text: "CREATE"
			onClicked: {
				swipeView.addItem(Qt.createComponent("FilledPage.qml").createObject(swipeView))
				swipeView.addItem(Qt.createComponent("EmptyPage.qml").createObject(swipeView))
				emptyPage.createdNewPage = true
			}		
		}
	}
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
