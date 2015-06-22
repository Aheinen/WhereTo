$(document).ready(function(event) {
  $('#container').on('swipeleft', '.event_picker_img', function(e){
    e.preventDefault();
    console.log('swiped left!');
  });

  $('#container').on('swiperight', '.event_picker_img', function(e){
    e.preventDefault();
    console.log('swiped right!');
  });

});

// var createWishlist = function(url, ) {
//   $.ajax({
//     url: url,

//   })
// }
