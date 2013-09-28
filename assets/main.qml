import bb.cascades 1.0
import bb.system 1.0
import "AddPage"
import "ChoicePage"


NavigationPane
{
    Page {
    id: firstPage
	    Container {
	        //Todo: fill me with QML
	        Label {
	            // Localized text with the dynamic translation and locale updates support
	            text:"Hello World"
	            textStyle.base: SystemDefaults.TextStyles.BigText
	        }
	    }
    }
    attachedObjects: [
        AddPage{
        	id: addItemPage
        },
        ChoicePage{
            id: choosePage
        }
    ]
}
