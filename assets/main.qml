import bb.cascades 1.0
import bb.system 1.0
import "AddPage"
import "ChoicePage"
import "CameraPage"

NavigationPane
{
    id: navPane
    onCreationCompleted: {
    	Qt.navPane = navPane;
        Qt.cameraPage = cameraPage;
        Qt.addPage = addPage;
    }
    Menu.definition: MenuDefinition {
        
        // Specify the actions that should be included in the menu
        actions: [
            ActionItem {
                title: "About"
                //imageSource: "asset:///images/menuicons/icon_info.png"
                
                onTriggered: {
                    //navPane.push(infoPage);
                }
            }
        ] // end of actions list
    } // end of MenuDefinition
    Page {
    id: firstPage
    actions: 
    [
        ActionItem 
        {
            ActionBar.placement: ActionBarPlacement.OnBar
            title: "Share"
            imageSource: "asset:///images/ic_share.png"
            onTriggered: 
            {
                //navPane.push(addItemPage);
            }
        },
        ActionItem 
        {
            ActionBar.placement: ActionBarPlacement.OnBar
            title: "Record"
            imageSource: "asset:///images/ic_play.png"
            onTriggered: 
            {
                navPane.push(choosePage);
            }
        }
    ]
	    Container {
	        //Todo: fill me with QML
	        background: Color.Black;
	        Label {
	            // Localized text with the dynamic translation and locale updates support
	            text:"Hello World"
	            textStyle.base: SystemDefaults.TextStyles.BigText
	        }
	    }
    }
    attachedObjects: 
    [
        AddPage{
        	id: addPage
            navPane: navPane
            actions: [
                ActionItem {
                    ActionBar.placement: ActionBarPlacement.OnBar
                    title: "Save"
                    imageSource: "asset:///images/ic_done.png"
                    
                    // When the action is selected, navigate directly
                    // to the first Page
                    onTriggered: {
                        addPage.saveAll();
                    }
                }
            ]
        },
        ChoicePage{
            id: choosePage
            navPane: navPane
            cameraPage: cameraPage
            addPage: addPage
        },
        CameraPage{
            id: cameraPage
        }
    ]
}
