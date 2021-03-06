import bb.cascades 1.0
import bb.system 1.0
import bb.cascades.multimedia 1.0
import bb.multimedia 1.0
import "AddPage"
import "ChoicePage"
import "CameraPage"

NavigationPane
{
    id: navPane
    //property alias foodData: foodData
    
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
    
    FirstPage 
    {
    	id: firstPage
        foodData: _foodDataModel
        //navPane: navPane 
    
    actions: 
    [
       /* ActionItem 
        {
            ActionBar.placement: ActionBarPlacement.OnBar
            title: "Share"
            imageSource: "asset:///images/ic_share.png"
            onTriggered: 
            {
                navPane.push(addItemPage);
            }
        },*/
        ActionItem 
        {
            ActionBar.placement: ActionBarPlacement.OnBar
            title: "Add Food"
            imageSource: "asset:///images/ic_add.png"
            onTriggered: 
            {
                navPane.push(choosePage);
            }
        }
    ]
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
            addPage: addPage
            
        }
    ]

}
