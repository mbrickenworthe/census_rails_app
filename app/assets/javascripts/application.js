// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require_tree ../javascripts/aminsition/.


$( document ).ready(function() {
  // var $canvas = $("canvas");
  // var context = $canvas[0].getContext("2d");
  // var mouseDown = false;
  // var lastEvent;

    $(".animsition").animsition({
      inClass: 'fade-in',
      outClass: 'flip-out-y-fr',
      inDuration: 1000,
      outDuration: 3000,
    });

  //   console.log( "ready!" );
  //   $(".tabs li").click(function(){
  //   $(this).siblings().removeClass("selected");
  //   $(this).addClass("selected");
  // });

  //   context.beginPath();
  //   context.moveTo(10, 10);
  //   context.lineTo(300, 10);
  //   context.stroke();

  //   $canvas.mousedown(function(event){
  //     lastEvent = event;
  //     console.log(lastEvent)
  //     mouseDown = true;
  //   }).mousemove(function(event){
  //     if (mouseDown) {
  //       context.beginPath();
  //       context.moveTo(lastEvent.offsetX, lastEvent.offsetY);
  //       context.lineTo(event.offsetX, event.offsetY);
  //       context.stroke();
  //       lastEvent = event;
  //     } 
  //   }).mouseup(function(){
  //     mouseDown = false;
  //   }).mouseleave(function(){
  //     $canvas.mouseup();
  //   });


});



