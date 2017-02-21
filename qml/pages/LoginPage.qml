import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.kaidan 1.0

Page {
	id: loginPage
	Column {
		anchors.fill: parent

		PageHeader {
			title: qsTr("Login")
		}

		TextField {
			id: jidField
			placeholderText: "user@example.org"
			label: qsTr("JID")
			width: parent.width
		}

		TextField {
			id: passField
			placeholderText: qsTr("Password")
			echoMode: TextInput.Password
			label: qsTr("Password")
			width: parent.width
		}

		//It's possibly would be better to make a Dialog
		Button{
			id: connectButton
			text: qsTr("Connect")
			onClicked: {
				connectButton.enabled = false;
				connectButton.text = qsTr("<i>Connecting...</i>");
				kaidan.mainConnect(jidField.text, passField.text);
			}

		}
	}

	Component.onCompleted: {
		function goToRoster() {
			//we need to disconnect enableConnectButton to prevent calling it on normal disconnection
			kaidan.connectionStateDisconnected.disconnect(enableConnectButton)
			//open the roster page
			pageStack.replace(Qt.resolvedUrl("RosterPage.qml"))
		}

		function enableConnectButton() {
			connectButton.text = qsTr("Retry")
			connectButton.enabled = true
		}

		kaidan.connectionStateConnected.connect(goToRoster)
		kaidan.connectionStateDisconnected.connect(enableConnectButton)
	}
}

