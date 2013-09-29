/* Copyright (c) 2012 Research In Motion Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.0
import bb.system 1.0
import bb.multimedia 1.0
import bb.cascades.multimedia 1.0
import "../AddPage"

Page {
    id: camera
    property AddPage addPage: addPage
    Container {
        background: Color.Black
        
        layout: DockLayout {}
        
        // The camera preview control
        Camera {
            id: objCamera
            
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            onTouch: {
                
                if(event.isDown())
                {
                    console.debug("capturing?");
                	objCamera.capturePhoto();
                }
                
            }
            onCreationCompleted: {
                 objCamera.open(CameraUnit.Rear);
            }
            onCameraOpened: {
                // Apply some settings after the camera was opened successfully
                getSettings(cameraSettings)
                cameraSettings.focusMode = CameraFocusMode.ContinuousAuto
                cameraSettings.shootingMode = CameraShootingMode.Stabilization
                cameraSettings.cameraRollPath = "/accounts/1000/shared/camera";
                applySettings(cameraSettings)
                
                // Start the view finder as it is needed by the barcode detector
                objCamera.startViewfinder()
                
            }
            onPhotoCaptured: {
                console.debug("CAMERA CAPTURE SUCCESS!")
            }
            onCameraOpenFailed: {
                console.debug("onCameraOpenFailed signal received with error " + error);
            }
            onViewfinderStartFailed: {
                console.debug("viewfinderStartFailed signal received with error " + error);
            }
            onViewfinderStopFailed: {
                console.debug("viewfinderStopFailed signal received with error " + error);
            }
            onPhotoCaptureFailed: {
                console.debug("photoCaptureFailed signal received with error " + error);
            }
            onPhotoSaveFailed: {
                console.debug("photoSaveFailed signal received with error " + error);
            }
            onPhotoSaved: {
                console.debug("photoSaved successfully, filaName:" + fileName);
                addPage.navPane.push(addPage);
            }
            
            onCameraResourceAvailable: {
                // This signal handler is triggered when the Camera resource becomes available to app
                // after being lost by for example putting the phone to sleep, once it has been received
                // it is possible to start the viewfinder again.
                objCamera.startViewfinder()
            }
            onReviewImageReady: {
                console.debug("previewready");
            }
            attachedObjects: [
                CameraSettings {
                    id: cameraSettings
                }
            ]
        }
    }
    
    attachedObjects: [
        SystemSound {
            id: scannedSound
            sound: SystemSound.GeneralNotification
        }
    ]
}