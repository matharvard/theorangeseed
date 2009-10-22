document.observe("dom:loaded", function() {
  setTimeout(TheOrangeSeed.toggleFlash, 0);
  
  Event.observe("toggleAdminButton", "click", function() {
    TheOrangeSeed.toggleAdmin();
  });
});

var TheOrangeSeed = {
  toggleFlash: function() {
    if ($("flash").visible()) {
      Effect.SlideUp("flash", { duration: 0.5 });
    } else {
      Effect.SlideDown("flash", { duration: 0.5 });
      setTimeout(TheOrangeSeed.toggleFlash, 3000);
    }
  },
  
  toggleAdmin: function() {
    if ($("publish").visible()) {
      Effect.SlideUp("publish", { duration: 0.5 });
    } else {
      Effect.SlideDown("publish", { duration: 0.5 });
    }
  }
}
