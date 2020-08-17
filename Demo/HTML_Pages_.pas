unit HTML_Pages_;

interface

uses
    Classes_HTML5_
  , Methods_HTML5_
  ;

function HomePage: string;

implementation

uses
    System.SysUtils
  ;

function HomePage: string;
var
  aHTML: THTMLTag;
begin
  aHTML :=  html( [ head(style('body {margin: 0px;padding: 0px;}'))
                  , body([
                            canvas('').id('myCanvas').width('578').height('200')
                         ,  script( ' window.requestAnimFrame = (function(callback) {'
                                  + '   return window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.oRequestAnimationFrame || window.msRequestAnimationFrame ||'
                                  + '   function(callback) {'
                                  + '     window.setTimeout(callback, 1000 / 60);'
                                  + '   };'
                                  + ' })();'
                                  + ' function drawRectangle(myRectangle, context) {'
                                  + '   context.beginPath();'
                                  + '   context.rect(myRectangle.x, myRectangle.y, myRectangle.width, myRectangle.height);'
                                  + '   context.fillStyle = ''#8ED6FF'';'
                                  + '   context.fill();'
                                  + '   context.lineWidth = myRectangle.borderWidth;'
                                  + '   context.strokeStyle = ''black'';'
                                  + '   context.stroke();'
                                  + ' }'
                                  + ' function animate(myRectangle, canvas, context, startTime) {'
                                  + '   // update'
                                  + '   var time = (new Date()).getTime() - startTime;'
                                  + '   var amplitude = 150;'
                                  + '   // in ms'
                                  + '   var period = 2000;'
                                  + '   var centerX = canvas.width / 2 - myRectangle.width / 2;'
                                  + '   var nextX = amplitude * Math.sin(time * 2 * Math.PI / period) + centerX;'
                                  + '   myRectangle.x = nextX;'
                                  + '   // clear'
                                  + '   context.clearRect(0, 0, canvas.width, canvas.height);'
                                  + '   // draw'
                                  + '   drawRectangle(myRectangle, context);'
                                  + '   // request new frame'
                                  + '   requestAnimFrame(function() {'
                                  + '     animate(myRectangle, canvas, context, startTime);'
                                  + '   });'
                                  + ' }'
                                  + ' var canvas = document.getElementById(''myCanvas'');'
                                  + ' var context = canvas.getContext(''2d'');'
                                  + ' var myRectangle = {'
                                  + '   x: 250,'
                                  + '   y: 70,'
                                  + '   width: 100,'
                                  + '   height: 50,'
                                  + '   borderWidth: 5'
                                  + ' };'
                                  + ' drawRectangle(myRectangle, context);'
                                  + ' // wait one second before starting animation'
                                  + ' setTimeout(function() {'
                                  + '   var startTime = (new Date()).getTime();'
                                  + '   animate(myRectangle, canvas, context, startTime);'
                                  + ' }, 1000);'
                                  )
                          ])
                 ] );
  Result := '<!DOCTYPE HTML>'#13#10 + aHTML.ToString;
  FreeAndNil(aHTML);
end;

end.
