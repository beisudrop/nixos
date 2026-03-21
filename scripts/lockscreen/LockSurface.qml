import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Fusion
import Quickshell.Wayland

Rectangle {
	id: root
	required property LockContext context
	readonly property ColorGroup colors: Window.active ? palette.active : palette.inactive

	color: colors.window

	Image {
		id: image
		source: "134951.png"
		width: parent.width
		height: parent.height
		fillMode: Image.PreserveAspectCrop
	}

	Label {
		id: clock
		property var date: new Date()

		anchors {
			horizontalCenter: parent.horizontalCenter
			top: parent.top
			topMargin: 100
		}

		renderType: Text.NativeRendering
		font.pointSize: 80

		Timer {
			running: true
			repeat: true
			interval: 60000

			onTriggered: clock.date = new Date();
		}

		text: {
			const hours = this.date.getHours().toString().padStart(2, '0');
			const minutes = this.date.getMinutes().toString().padStart(2, '0');
			return `${hours}:${minutes}`;
		}
	}

	ColumnLayout {
		visible: Window.active

		anchors {
			horizontalCenter: parent.horizontalCenter
			top: parent.top
			topMargin: 300
		}

		RowLayout {
			TextField {
				id: passwordBox

				implicitWidth: 400
				padding: 10

				focus: true
				enabled: !root.context.unlockInProgress
				echoMode: TextInput.Password
				inputMethodHints: Qt.ImhSensitiveData

				onTextChanged: root.context.currentText = this.text;

				onAccepted: root.context.tryUnlock();

				Connections {
					target: root.context

					function onCurrentTextChanged() {
						passwordBox.text = root.context.currentText;
					}
				}
			}

			Button {
				text: "Unlock"
				padding: 10

				focusPolicy: Qt.NoFocus

				enabled: !root.context.unlockInProgress && root.context.currentText !== "";
				onClicked: root.context.tryUnlock();
			}
		}

		Label {
			visible: root.context.showFailure
			text: "Incorrect password"
		}
	}
}
