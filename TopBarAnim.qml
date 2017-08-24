import QtQuick 2.5

Item {

   //property alias topanimrun: seqrun.running
   //anchors.fill: parent
   function wsistalking() {
            seqrun.running = true
            canvasmiddlegraphics.visible = !canvasmiddlegraphics.visible
    }
    
   SequentialAnimation {
        id: seqrun
        
        ParallelAnimation {
        NumberAnimation{
        target: canvasmiddlegraphics
        property: "i"
        from: -50
        to: -70
        duration: 200
        }

        SequentialAnimation {
            loops: 10
            
            ParallelAnimation {
            NumberAnimation{
            target: canvasmiddlegraphics
            property: "amplitude"
            from: 0
            to: 10 + Math.floor(Math.random() * 6) + 1  
            duration: 12
            }
                }
            
            ParallelAnimation {
            NumberAnimation{
            target: canvasmiddlegraphics
            property: "amplitude"
            from: 10
            to: 16 + Math.floor(Math.random() * 2) + 1  
            duration: 12

                }
            }

            ParallelAnimation{
            NumberAnimation{
            target: canvasmiddlegraphics
            property: "amplitude"
            from: 16 + Math.floor(Math.random() * 2) + 1
            to: 10 + Math.floor(Math.random() * 6) + 1
            duration: 12
                }
                }
                
            ParallelAnimation {    
            NumberAnimation{
            target: canvasmiddlegraphics
            property: "amplitude"
            from: 10 + Math.floor(Math.random() / 6) + 1
            to: 0
            duration: 12
                } 

            }
            }
        }

        ParallelAnimation {
        
        PropertyAnimation {
            target: canvasmiddlegraphics
            property: "visible"
            from: true
            to: false
            duration: 20
            }
        }
    }
    
    Canvas {
                          id:canvasmiddlegraphics
                          width: parent.width
                          height: parent.height
                          anchors.verticalCenter: parent.verticalCenter
                          anchors.horizontalCenter: parent.horizontalCenter
                          visible: true

                          property color strokeStyle:  Qt.darker(fillStyle, 1.5)
                          property color fillStyle: Qt.darker("deepskyblue", 1.1)
                          property real lineWidth: 1.6
                          property bool fill: true
                          property bool stroke: false
                          property real alpha: 1.0
                          property real scale : 1
                          property real rotate : 0
                          property real i: -50
                          property real waveSpeed: 10
                          property real amplitude: 0
                          antialiasing: true
                          smooth: true

                          onLineWidthChanged:requestPaint();
                          onFillChanged:requestPaint();
                          onStrokeChanged:requestPaint();
                          onScaleChanged:requestPaint();
                          onRotateChanged:requestPaint();
                          onIChanged: requestPaint();

                          renderTarget: Canvas.FramebufferObject
                          renderStrategy: Canvas.Cooperative


              onPaint: {
                              var ctxside = canvasmiddlegraphics.getContext('2d');
                              var hCenter = width * 0.5
                              var vCenter = height * 0.5
                              var size = 12
                              var period = 15;
                              var dotSpeed = 5;

                              function draw_line(i){
                                  var oStartx=0;
                                  var oStarty=( height / 2 )
                                  ctxside.beginPath();
                                  ctxside.moveTo( oStartx, oStarty + amplitude * Math.sin( x / period + ( i  / 5 ) ) );
                                  ctxside.lineWidth = 1;
                                  ctxside.strokeStyle = 'steelblue';

                                  for(var Vx = oStartx; Vx < width * 1; Vx++) {

                                      var Vy = amplitude * Math.sin( Vx / period + ( i  / 5 + Math.floor(Math.random() * 2) + 0));
                                      ctxside.lineTo( oStartx + Vx,  oStarty + Vy);
                                  }

                                   ctxside.stroke();
                              }

                              function render(){
                                  var st = i
                                  ctxside.clearRect(0, 0, width, height);
                                  draw_line(st)

                              }
                  render();
              }

    }
  
}
