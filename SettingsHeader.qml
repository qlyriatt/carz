import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15


ToolBar {
	id: toolBar
	height: 56
	width: 360
	Material.elevation: 5
	
	ToolButton {
		anchors.verticalCenter: parent.verticalCenter
		anchors.left: parent.left
		anchors.leftMargin: 10
		
		contentItem: Rectangle {
			height: 10
			width: 10
			radius: 20
			border.width: 2
		}
		
		onClicked: {
//			settingsLoader.source = ""
//			headerLoader.source = "DefaultHeader.qml"
		}				
	}	
}
