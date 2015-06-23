$(document).ready(function(event) {
  baseURL = 'http://localhost:3000/'
  $('#container').on('swipeleft', '.image', function(e){
    e.preventDefault();
    var data = {accepted: false};
    createWishlist(data);
  });

  $('#container').on('swiperight', '.image', function(e){
    e.preventDefault();
    var data = {accepted: true};
    createWishlist(data);
  });

});

var createWishlist = function(data) {
  var user_id = $('#container').attr('class')
  var event_id = $('.image').attr('id');
  var url = 'users/' + user_id + '/events/' + event_id + '/wishlists'
  $.ajax({
    url: baseURL + url,
    type: "POST",
    data: data
  })
  .done(function(response){
    template = Handlebars.compile($("#single-event-template").html());
    var desc = "<p>Description: " + response.event.description + "</p>";
    $("#container").html(template(response));
    $('#container a').append(desc);
  })
  .fail(function(){
    alert('fail');
  })
}
