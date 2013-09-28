import bb.cascades 1.0
import "../CameraPage"

Page {
	id: choicePage
	property NavigationPane navPane: navPane
	Container {
        ImageButton {
            id: camChoice
            defaultImageSource: "asset:///images/placeholder.jpg"
            horizontalAlignment: HorizontalAlignment.Center
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
	attachedObjects: [
    	CameraPage{
                id: cameraPage
        }
    ]
}