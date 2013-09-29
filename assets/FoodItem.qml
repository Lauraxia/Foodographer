import bb.cascades 1.0

Container {
    id: foodItem
    property string desc: ListItemData.description
    property string time: ListItemData.time //TODO: as actual time variable?
    property string mood: ListItemData.faceSelection
    property int calories: ListItemData.calorieValue
    property double scale: ListItemData.sliderValue;
    property string picture: ListItemData.imageUrl;
    
    onCreationCompleted: {
        console.debug(scale);
    }
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
                background: Color.create((128 + 127*Math.cos(2.09439*scale))/255.0,(128 + 127*Math.cos(2.09439*scale-2.09439))/255.0,0,1)
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
            bottomPadding: 58
            preferredHeight: 58
            maxHeight: 58
            minHeight: 58
            background: Color.White
            verticalAlignment: VerticalAlignment.Bottom
            horizontalAlignment: HorizontalAlignment.Fill
            
            Label {
                text: calories
                horizontalAlignment: HorizontalAlignment.Right
                verticalAlignment: VerticalAlignment.Center
            
            }
            
        }
        Container {
            verticalAlignment: VerticalAlignment.Bottom;
            horizontalAlignment: HorizontalAlignment.Left;
            //leftPadding: 10
            ImageView {
                imageSource: "asset:///images/small/"+ mood+ ".png"
               scaleX: 0.7
               scaleY: 0.7
            }
        }
        
        
        Container {
            verticalAlignment: VerticalAlignment.Top
            horizontalAlignment: HorizontalAlignment.Fill
            Label {
                text: time
                horizontalAlignment: HorizontalAlignment.Right
                bottomMargin: 0
                textStyle.color: Color.White;
            }
        }
        
        
    }
    
        
}

