import bb.cascades 1.0
import bb.system 1.0
import "AddPage"
import "ChoicePage"


NavigationPane
{
    id: navPane
    //property alias foodData: foodData
    
    onCreationCompleted: {
    	Qt.navPane = navPane;
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
        ActionItem 
        {
            ActionBar.placement: ActionBarPlacement.OnBar
            title: "Add Food"
            //imageSource: "asset:///images/menuicons/ic_nav_to.png"
            onTriggered: 
            {
                navPane.push(addItemPage);
            }
        },
        ActionItem 
        {
            ActionBar.placement: ActionBarPlacement.OnBar
            title: "Choice"
            //imageSource: "asset:///images/menuicons/ic_nav_to.png"
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
        id: addItemPage
    },
    ChoicePage{
        id: choosePage
        navPane: navPane
    }
]
}
