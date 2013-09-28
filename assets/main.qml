import bb.cascades 1.0
import bb.system 1.0
import "AddPage"
import "ChoicePage"


NavigationPane
{
    id: navPane
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
        }
    ]
}
