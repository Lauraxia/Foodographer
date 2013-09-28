import bb.cascades 1.0

Page 
{
    id: addPage
    
    Container {
        TextField {
            id: addFood
            hintText: "Add a Food"
        }
        Container {
            leftPadding: 20
            rightPadding: 20
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }

            Label {
                text: "Calories:"
                verticalAlignment: VerticalAlignment.Center
            }
            TextField {
                id: calories
            }
        }
        Container 
        {
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            ImageButton 
            {
                verticalAlignment: VerticalAlignment.Center
                defaultImageSource: "asset:///images/placeholder.jpg"

            }
            ImageButton 
            {
                verticalAlignment: VerticalAlignment.Center
                defaultImageSource: "asset:///images/placeholder.jpg"
            }
            ImageButton 
            {
                verticalAlignment: VerticalAlignment.Center
                defaultImageSource: "asset:///images/placeholder.jpg"
            }
        }
        Container 
        {
            layout: DockLayout {

            }
            leftPadding: 20
            rightPadding: 20
            
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Bottom
            Label {
                text: "Bad"
                horizontalAlignment: HorizontalAlignment.Left
                verticalAlignment: VerticalAlignment.Center
            }
            Label {
                text: "Good"
                horizontalAlignment: HorizontalAlignment.Right           
                verticalAlignment: VerticalAlignment.Center
            }
        }
        Slider {
            id: goodBadSlider
            value: 0.5
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Bottom
        }

    }
}