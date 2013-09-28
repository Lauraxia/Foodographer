import bb.cascades 1.0

Page 
{
    id: firstPage
    property alias foodData: foodList.dataModel
    Container 
    {
        //Todo: fill me with QML
        background: Color.Black;
        horizontalAlignment: HorizontalAlignment.Fill;
        
        ListView 
        {
            horizontalAlignment: HorizontalAlignment.Fill;
            id: foodList
            onDataModelChanged: {
                console.log("Route Data model changed!!!");
            
            }
            layout: GridListLayout {
                columnCount: 2
            }
            listItemComponents: [
                ListItemComponent {
                    type: "foodItem"
                    FoodItem {
                    } 
                }
            ]                
            
            // Item type-mapping
            function itemType(data, indexPath) 
            {
                if (indexPath.length == 1) 
                {
                    console.debug("adding a fooditem to list!")
                    return 'foodItem';
                }
            }
        
        }
    }
}
