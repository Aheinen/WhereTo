$(document).ready(function(event) {
  console.log('we are here')
  $('#container').on('swipeleft', '.image', function(e){
    e.preventDefault();
    console.log('swiped left!');
  });

  $('#container').on('swiperight', '.image', function(e){
    e.preventDefault();
    console.log('swiped right!');
  });

});

// var createWishlist = function(url, ) {
//   $.ajax({
//     url: url,

//   })
// }
