import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
	id: rectangle
	width: 360
	height: 40
	visible: true
	color: "#00000000"	
	
	Rectangle {
		id: imageRectangle
		width: 30
		height: 30
		color: "#000000"
		anchors.left: parent.left
		anchors.top: parent.top
		anchors.bottom: parent.bottom
		anchors.bottomMargin: 5
		anchors.topMargin: 5
		anchors.leftMargin: 10
	}
	
	ProgressBar {
		id: progressBar
		height: 6
		anchors.verticalCenter: parent.verticalCenter
		anchors.left: imageRectangle.right
		anchors.leftMargin: 10
		value: model.value / model.threshold	
	}
	 
	 Text {
		 id: text1
		 text: model.value + "/" + model.threshold
		 anchors.verticalCenter: parent.verticalCenter
		 anchors.left: progressBar.right
		 font.pixelSize: 12
		 anchors.leftMargin: 10
		 maximumLineCount: 20
	 }
}
/*##^##
Designer {
    D{i:0;formeditorZoom:1.75}
}
##^##*/
