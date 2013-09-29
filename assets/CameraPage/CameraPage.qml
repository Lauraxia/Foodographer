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
import bb.cascades.multimedia 1.0
import bb.multimedia 1.0
import "../AddPage"

Page {
    id: cameraPage
    property AddPage addPage: addPage
    Container {
        background: Color.Black
        
        layout: DockLayout {}
        
        // The camera preview control
        Camera {
            id: camera
            
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            onCreationCompleted: {
                camera.open();
                camera.photoCaptured.connect(onPhotoCaptured)
                camera.photoCapturedFailed.connect(onPhotoCaptureFailed)
            }
            onCameraOpened: {
                // Apply some settings after the camera was opened successfully
                getSettings(cameraSettings)
                cameraSettings.focusMode = CameraFocusMode.ContinuousAuto
                cameraSettings.shootingMode = CameraShootingMode.Stabilization
                applySettings(cameraSettings)
                
                // Start the view finder as it is needed by the barcode detector
                camera.startViewfinder()
            }
            onPhotoCaptured: {
                console.debug("CAMERA CAPTURE SUCCESS!")
            }
            onPhotoCaptureFailed: {
                console.debug("CAMARA CAPTURE FAILED");
            }
            onViewfinderStarted: {
            }
            
            attachedObjects: [
                CameraSettings {
                    id: cameraSettings
                }
            ]
        }
        
        Label {
            autoSize.maxLineCount: 1
            text: "Tap To Take a Picture"
            horizontalAlignment: HorizontalAlignment.Center
            textStyle.color: Color.White
        }
        // The area at the top that shows the results
        Container {
            id: resultArea
            
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Top
            
            layout: DockLayout {}
            
            visible: false
        }
        ImageView {
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            onTouch: {
                camera.capturePhoto();
                addPage.navPane.push(addPage);
            }
        }

    }
    
    attachedObjects: [
        SystemSound {
            id: scannedSound
            sound: SystemSound.GeneralNotification
        }
    ]
}