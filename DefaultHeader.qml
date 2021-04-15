import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15


ToolBar {	
	height: 56
	width: 360
	Material.elevation: 5

	Label {
		text: "Carz"
		font.bold: true
		font.pointSize: 24
		font.family: "Roboto"
		anchors.left: parent.left
		anchors.leftMargin: 10
		anchors.verticalCenter: parent.verticalCenter
	}
	
	ToolButton {
		anchors.verticalCenter: parent.verticalCenter
		anchors.right: parent.right
		anchors.rightMargin: 10
		
		contentItem: Rectangle {
			height: 10
			width: 10
			radius: 20
			border.width: 2
		}
		
		onClicked: {
//			settingsLoader.source = "SettingsPage.qml"
			headerLoader.source = "SettingsHeader.qml"
			settingsPopup.open()
		}
	}
}
