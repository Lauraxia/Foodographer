import bb.cascades 1.0
import bb.cascades.multimedia 1.0
import bb.multimedia 1.0
import "../AddPage"

Page {
    id: cameraPage
    property AddPage addPage: addPage
    Container {
        layout: DockLayout {
        }
        Container {
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill

            // This is the camera control that is defined in the cascades multimedia library.
            Camera {
                id: camera
                onTouch: {
                    if (event.isDown()) {
                        // Take photo
                        capturePhoto();
                    }
                }
                onCameraOpened: {
                    
                    // Additional camera settings, setting focus mode and stabilization
                    getSettings(cameraSettings)
                    cameraSettings.focusMode = CameraFocusMode.ContinuousAuto
                    cameraSettings.shootingMode = CameraShootingMode.Stabilization
                    applySettings(cameraSettings)                    
                    camera.startViewfinder();
                }
                onShutterFired: {
                    cameraSound.play();
                }
                onCameraResourceAvailable: {
                    camera.startViewfinder()
                }

				onCreationCompleted: {
                    camera.open(CameraUnit.Rear);
                }
                onPhotoSaved: { 
                   addPage.navPane.pop();
                   addPage.navPane.push(addPage);
                   addPage.imageUrl = fileName;
                }
                attachedObjects: [
                    CameraSettings {
                        id: cameraSettings
                    },
                    SystemSound {
                        id: cameraSound
                        sound: SystemSound.CameraShutterEvent
                    }
                ]
            }
        }
}
}// Page