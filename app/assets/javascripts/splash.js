$( document ).ready(function() {

  var $canvas = $("canvas");
  if ($("canvas").length === 1 ) {
  var context = $canvas[0].getContext("2d");
  var mouseDown = false;
  var lastEvent;
  
    $canvas.mousedown(function(event){
      lastEvent = event;
      console.log(lastEvent)
      mouseDown = true;
    }).mousemove(function(event){
      if (mouseDown) {
        context.beginPath();
        context.moveTo(lastEvent.offsetX, lastEvent.offsetY);
        context.lineTo(event.offsetX, event.offsetY);
        context.stroke();
        lastEvent = event;
      } 
    }).mouseup(function(){
      mouseDown = false;
    }).mouseleave(function(){
      $canvas.mouseup();
    });
  }
});

