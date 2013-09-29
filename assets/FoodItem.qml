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
        layout: DockLayout {
            
        }
        preferredHeight: 480
        minHeight: 480
        preferredWidth: 380
        minWidth: 350
        maxWidth: 350
        leftMargin: 20
        rightMargin: 20
        bottomMargin: 20
        bottomPadding: 30
        Container {
            topPadding: 50
            preferredHeight: 400
            verticalAlignment: VerticalAlignment.Top
            Container {
                topPadding: 7
                bottomPadding: 7
                background: Color.DarkGreen;
                verticalAlignment: VerticalAlignment.Top
                Container {
                    topPadding: 3
                    bottomPadding: 3
	                background: Color.DarkGray;
		            ImageView {
		                maxHeight: 350
		                maxWidth: 350
		                imageSource: "asset:///images/placeholder.jpg"
		                scalingMethod: ScalingMethod.AspectFill
		            }
		        }
	        }
            
        }
        Container {
            bottomPadding: 50
            preferredHeight: 50
            maxHeight: 50
            minHeight: 50
            background: Color.White
            verticalAlignment: VerticalAlignment.Bottom
            horizontalAlignment: HorizontalAlignment.Fill
            
            Label {
                text: "250"
                horizontalAlignment: HorizontalAlignment.Right
                verticalAlignment: VerticalAlignment.Bottom
            
            }
            ImageView {
                imageSource: "asset:///images/0.png"
                scaleX: 0.5
                scaleY: 0.5
                verticalAlignment: VerticalAlignment.Bottom;
                horizontalAlignment: HorizontalAlignment.Left;
            }
        }
        
        
        Container {
            verticalAlignment: VerticalAlignment.Top
            horizontalAlignment: HorizontalAlignment.Fill
            Label {
                text: "9:17 AM"
                horizontalAlignment: HorizontalAlignment.Right
                bottomMargin: 0
                textStyle.color: Color.White;
            }
        }
        
        
    }
    
        
}

