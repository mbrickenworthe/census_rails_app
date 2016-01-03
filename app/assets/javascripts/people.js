// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

 document.getElementById("test").addEventListener("click", function( event ) {
    // display the current click count inside the clicked div
    event.target.innerHTML = "click count: " + event.detail;
  }, false);

