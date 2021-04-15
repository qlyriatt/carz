import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

Rectangle {
	
	property alias carModel: listModel
	
	id: outerPageRectangle
	width: 360
	height: 616 - 56
	color: Material.color(Material.Amber)
	
	Rectangle {
		id: innerPageRectangle
		radius: 10
		border.width: 3
		anchors.fill: parent
		anchors.topMargin: 20
		anchors.rightMargin: 20
		anchors.leftMargin: 20
		anchors.bottomMargin: 20
		
		TextField {
			id: textField
			height: 48
			visible: true
			anchors.left: parent.left
			anchors.right: parent.right
			anchors.top: parent.top
			anchors.rightMargin: 10
			anchors.leftMargin: 10
			anchors.topMargin: 10   
			placeholderText: qsTr("Text Field")
			
			onAccepted: focus = false
			onEditingFinished: focus = false
		}
		
		ListView {
			id: listView			
			anchors.top: textField.bottom
			anchors.topMargin: 10
			anchors.bottom: parent.bottom
			anchors.left: parent.left
			anchors.right: parent.right
			interactive: false
			delegate: ListDelegate {}
			model: listModel
			spacing: 10	
			
			ListModel {
				id: listModel
				ListElement {
					name: "param1"
					threshold: 1500
					value: 1200
				}
				
				ListElement {
					name: "param2"
					threshold: 45000
					value: 21000
				}
				
				ListElement {
					name: "param3"
					threshold: 150000
					value: 100000
				}
				
				ListElement {
					name: "param4"
					threshold: 15000
					value: 9000
				}
			}					
		}	
		
		Button {
			id: deleteButton
			highlighted: true
			Material.accent: Material.Red
			text: "DELETE"
			anchors.right: parent.right
			anchors.bottom: parent.bottom
			font.pointSize: 12
			anchors.rightMargin: 10
			anchors.bottomMargin: 5
			
			TapHandler {
				onTapped: 
				{
					swipeView.removeItem(swipeView.currentItem)
				}
			}
		}
		
	} //innerPageRectangle
	
} //outerPageRectangle

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
