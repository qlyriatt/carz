import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import carGeneration 1.0


Rectangle {
	id: outerPageRectangle
	width: 360
	height: 616 - 56
	color: Material.color(Material.Amber)
	
	Rectangle {
		id: innerPageRectangle
		radius: 10
		border.width: 2
		border.color: Material.color(Material.Grey)
		
		anchors.fill: parent
		anchors.topMargin: 20
		anchors.rightMargin: 20
		anchors.leftMargin: 20
		anchors.bottomMargin: 20
		
		Rectangle {
			id: addNewButton
			anchors.verticalCenter: parent.verticalCenter
			anchors.verticalCenterOffset: -40
			anchors.horizontalCenterOffset: 0
			anchors.horizontalCenter: parent.horizontalCenter
			height: 100
			width: 100
			radius: 200
			border.color: Material.color(Material.Grey)
			border.width: 3
			
			TapHandler {
				onTapped: {
					newCarPopup.open()
				}
			}		
		}
		
		Text {
			id: text1
			text: qsTr("Add new")
			anchors.verticalCenter: parent.verticalCenter
			color: Material.color(Material.Grey)
			font.pixelSize: 24
			anchors.verticalCenterOffset: 40
			anchors.horizontalCenter: parent.horizontalCenter
		}
	}	
}

