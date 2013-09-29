import bb.cascades 1.0

Page 
{
    titleBar: TitleBar {
        title: "Add Food"
    }
    id: addPage
    property int faceSelection;   
    property NavigationPane navPane: navPane 
    Container {
        topPadding: 40
        leftPadding: 40
        rightPadding: 40
        onCreationCompleted: {
            faceSelection = 2;
        }
        TextField {
            id: addFood
            hintText: "Description"
        }
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }

            /*Label {
                text: "Calories:"
                verticalAlignment: VerticalAlignment.Center
            }*/
            TextField {
                id: calories
                hintText: "Calories"
            }
        }

        Divider {

        }
        Label 
        {
            id: moodLabel
            text: "How are you feeling? -- Neutral"
        }
        Container 
        {
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            ImageButton 
            {
                id: sadFace
                verticalAlignment: VerticalAlignment.Center
                onTouch: {
                    sadFace.setDefaultImageSource("asset:///images/0.png");
                    tiredFace.setDefaultImageSource("asset:///images/1g.png");
                    neutralFace.setDefaultImageSource("asset:///images/2g.png");
                    happyFace.setDefaultImageSource("asset:///images/3g.png");
                    coolFace.setDefaultImageSource("asset:///images/4g.png");
                    faceSelection = 0;
                    moodLabel.text = "How are you feeling? -- Sad";
                }
                defaultImageSource: "asset:///images/0g.png"
                layoutProperties: AbsoluteLayoutProperties {

                }
            }
            ImageButton 
            {
                id: tiredFace
                verticalAlignment: VerticalAlignment.Center
                onTouch: {
                    faceSelection = 1;
                    sadFace.setDefaultImageSource("asset:///images/0g.png");
                    tiredFace.setDefaultImageSource("asset:///images/1.png");
                    neutralFace.setDefaultImageSource("asset:///images/2g.png");
                    happyFace.setDefaultImageSource("asset:///images/3g.png");
                    coolFace.setDefaultImageSource("asset:///images/4g.png");
                    moodLabel.text = "How are you feeling? -- Tired"
                }
                defaultImageSource: "asset:///images/1g.png"
            }
            ImageButton 
            {
                id: neutralFace
                verticalAlignment: VerticalAlignment.Center
                onTouch: {  
                    faceSelection = 2;
                    sadFace.setDefaultImageSource("asset:///images/0g.png");
                    tiredFace.setDefaultImageSource("asset:///images/1g.png");
                    neutralFace.setDefaultImageSource("asset:///images/2.png");
                    happyFace.setDefaultImageSource("asset:///images/3g.png");
                    coolFace.setDefaultImageSource("asset:///images/4g.png");
                    moodLabel.text ="How are you feeling? -- Neutral"
                }
                defaultImageSource: "asset:///images/2.png"
            }
            ImageButton 
            {
                id: happyFace
                verticalAlignment: VerticalAlignment.Center
                onTouch: {
                    faceSelection = 3;
                    sadFace.setDefaultImageSource("asset:///images/0g.png");
                    tiredFace.setDefaultImageSource("asset:///images/1g.png");
                    neutralFace.setDefaultImageSource("asset:///images/2g.png");
                    happyFace.setDefaultImageSource("asset:///images/3.png");
                    coolFace.setDefaultImageSource("asset:///images/4g.png");
                    moodLabel.text ="How are you feeling? -- Happy"
                }
                defaultImageSource: "asset:///images/3g.png"
            }
            ImageButton 
            {
                id: coolFace
                verticalAlignment: VerticalAlignment.Center
                onTouch: {
                    faceSelection = 4
                    sadFace.setDefaultImageSource("asset:///images/0g.png");
                    tiredFace.setDefaultImageSource("asset:///images/1g.png");
                    neutralFace.setDefaultImageSource("asset:///images/2g.png");
                    happyFace.setDefaultImageSource("asset:///images/3g.png");
                    coolFace.setDefaultImageSource("asset:///images/4.png");
                    moodLabel.text ="How are you feeling? -- Elated"
                }
                defaultImageSource: "asset:///images/4g.png"
            }
        }
        Divider {

        }
        Label {
            text: "Was this a good choice?"
            //horizontalAlignment: HorizontalAlignment.Center
        }
        Slider {
            id: goodBadSlider
            value: 0.5
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Bottom
            onValueChanged: {
                console.debug(goodBadSlider.value);
            }
        }
        Container 
        {
            layout: DockLayout {
            }
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
    }
    function saveAll()
    {
        if (isNaN(calories.text) || calories.text == "")
        {
            console.log("Invalid Calorie input");
        }
        var description = addFood.text;
        var calorieValue = Number(calories.text);
        var sliderValue = goodBadSlider.value;
        var imageUrl = "";
        var time = new Date().toString();
        ApplicationUI.AddFoodItem(imageUrl, description, calorieValue, faceSelection, sliderValue, time )
        navPane.pop();
        navPane.pop();
    }
}