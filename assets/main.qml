import bb.cascades 1.0
import bb.system 1.0
import "AddPage"
import "ChoicePage"


NavigationPane
{
    id: navPane
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
    Page {
    id: firstPage
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
        	id: addItemPage
        },
        ChoicePage{
            id: choosePage
            navPane: navPane
        }
    ]
}
