import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.kaidan 1.0


Page {
	id: rosterPage
	SilicaFlickable {
		anchors.fill: parent
		SilicaListView {
			id: rosterView
			anchors.fill: parent
			model: kaidan.rosterController.rosterList
			delegate: Item {
				height: Theme.itemSizeSmall
				Label {text: model.modelData.jid}
			}
			VerticalScrollDecorator {}
		}
	}
}




