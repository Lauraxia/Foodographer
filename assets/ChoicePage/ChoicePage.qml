import bb.cascades 1.0
import "../CameraPage"
import "../AddPage"

Page {
	id: choicePage
	property NavigationPane navPane: navPane
    property CameraPage cameraPage: cameraPage
    property AddPage addPage: addPage
	Container {
	    topPadding: 300
	    bottomPadding: 300
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
        
        ImageButton {
            id: textChoice
            defaultImageSource: "asset:///images/ic_rename.png"
            horizontalAlignment: HorizontalAlignment.Center
            scaleX: 4.0
            scaleY: 4.0
            onClicked: {
                navPane.push(addPage);
            }
        }
    }
}