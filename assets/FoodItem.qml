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
        preferredHeight: 340
        preferredWidth: 340
        minWidth: 340
        maxWidth: 340
        leftMargin: 20
        rightMargin: 20
        bottomMargin: 20
        background: Color.White
        
        Label {
            text: "This is a test!"
        }
    }
    
        
}

