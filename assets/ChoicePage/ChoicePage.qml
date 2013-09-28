import bb.cascades 1.0
import "../CameraPage"

Page {
	id: choicePage
	property NavigationPane navPane: navPane
    property CameraPage cameraPage: cameraPage
	Container {
        ImageButton {
            id: camChoice
            defaultImageSource: "asset:///images/camera.png"
            horizontalAlignment: HorizontalAlignment.Center
            scaleX: 4.0
            scaleY: 4.0
            onClicked: {
                navPane.push(cameraPage);
            }
        }
        ListView {
            id: choiceList
            horizontalAlignment: HorizontalAlignment.Fill
            layout: StackListLayout 
            {
                orientation: LayoutOrientation.LeftToRight
            }
        }
        Button {
            id: inputChoice
            text: "Text Input"
            horizontalAlignment: HorizontalAlignment.Center            
        }
    }
}