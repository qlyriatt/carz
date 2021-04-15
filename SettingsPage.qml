import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15


Rectangle {
	id: outerPageRectangle
	width: 360
	height: 616 - 56
	color: "#ffffff"

	
	ListView {
		id: listView
		anchors.left: parent.left
		anchors.right: parent.right
		anchors.top: parent.top
		anchors.bottom: parent.bottom
					
		delegate: Item {
					
			 x: 5
			 width: 80
			 height: 40
			 Row {
				 id: row1
				 spacing: 10
				 Rectangle {
					 width: 40
					 height: 40
					 color: colorCode
				 }
	
				 Text {
					 text: name
					 anchors.verticalCenter: parent.verticalCenter
					 font.bold: true
				 }
			 }
		 }
		 
		 
		 model: ListModel {
			 ListElement {
				 name: "Grey"
				 colorCode: "grey"
			 }
	
			 ListElement {
				 name: "Red"
				 colorCode: "red"
			 }
	
			 ListElement {
				 name: "Blue"
				 colorCode: "blue"
			 }
	
			 ListElement {
				 name: "Green"
				 colorCode: "green"
			 }
		 }
	}
	
}


