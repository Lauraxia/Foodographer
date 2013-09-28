import bb.cascades 1.0

Container {
    id: foodItem
    
    property string desc: ListItemData.desc
    property string time: ListItemData.time //TODO: as actual time variable?
    property string mood: ListItemData.mood
    property int calories: ListItemData.calories
    property int scale: ListItemData.scale;
    property string picture: ListItemData.picture;
    
    Container {
        
    }
    
        
}

