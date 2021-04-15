import QtQuick 2.15
import QtQuick.Controls 2.15
import carGeneration 1.0


Popup {		
	onOpened: {

		manufacturer.populateModel() // <-------
	}
		
	modal: true
	background: Rectangle {
		x: 20
		y: 20
		width: applicationWindow.width - 40
		height: applicationWindow.height - 56 - 40
		radius: 10
		border.color: "black"
		border.width: 2
	}

	contentItem: Item {
		anchors.fill: parent.background
		
		ComboBox {
			id: manufacturer
			editable: true
			anchors.top: parent.top
			anchors.topMargin: 20
			anchors.horizontalCenter: parent.horizontalCenter
			model: ListModel {}
			
			//fill on empty
			function populateModel() {
				if (manufacturer.model.count === 0)
					for (let i = 0; i < carClass.getManufacturersSize(); i++)
						manufacturer.model.append({"name": carClass.getManufacturer(i)})
			}		
		}
		
		ComboBox {
			id: model
			editable: false
			flat: true
			
			anchors.top: parent.top
			anchors.topMargin: 80				
			anchors.horizontalCenter: parent.horizontalCenter
		}
		
		CarClass {id: carClass}
		
		Button {
		anchors.centerIn: parent
			onClicked: {
				carClass.generateQuery(manufacturer.currentText, model.currentText)
				
				swipeView.addPage("FilledPage.qml")
				let listModel = swipeView.itemAt(swipeView.currentIndex + 1).carModel
				
				listModel.append({"name": "param5", "threshold": carClass.getThreshold(0), "value": 300})
				listModel.append({"name": "param6", "threshold": carClass.getThreshold(1), "value": 300})
				listModel.append({"name": "param7", "threshold": carClass.getThreshold(2), "value": 300})
				
				swipeView.moveItem(swipeView.currentIndex, swipeView.count - 1)
				swipeView.currentIndex -= 1
				
				newCarPopup.close()
			}
		}	
	}
}
