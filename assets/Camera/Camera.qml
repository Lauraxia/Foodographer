import bb.cascades.multimedia 1.0
import bb.multimedia 1.0
import bb.cascades 1.0
import bb.system 1.0

Page {
    content: Container {
        id: cameraObj
        onTouch: {
            if(event.isDown())
            {
                CameraObj.capturePhoto();
            }
        }        
    }
}
