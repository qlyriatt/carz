import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import carGeneration 1.0

ApplicationWindow {	
	id: applicationWindow
	width: 360
	height: 616
	visible: true
	
	
	header: Loader {	
		id: headerLoader
		source: "DefaultHeader.qml"
	}		

	SwipeView {
		id: swipeView
		anchors.fill: parent
		
		function addPage(str) {
			var page = Qt.createComponent(str).createObject(swipeView)
			addItem(page)
		}
		
		EmptyPage {}
	}
	
	PageIndicator {
		id: indicator
		anchors.bottom: parent.bottom
		anchors.horizontalCenter: parent.horizontalCenter
		count: swipeView.count
		currentIndex: swipeView.currentIndex
	}	
	
	SettingsPopup {id: settingsPopup}
		
	NewCarPopup {id: newCarPopup}
}
