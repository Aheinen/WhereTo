$(document).ready(function(event) {
  $('.ui-panel-wrapper').remove()
  var ref = new Firebase("https://wheretodbc.firebaseIO.com");

  $('#login').on('click', function(e){
   e.preventDefault();
   ref.authWithOAuthPopup("facebook", function(error, authData) {
     if (error) {
       console.log("Login Failed!", error);
     } else {
      var firstName = authData.facebook.cachedUserProfile.first_name;
      var lastName = authData.facebook.cachedUserProfile.last_name;
      var email = authData.facebook.email;
      var picture = authData.facebook.cachedUserProfile.picture.data.url;
      var userInfo = {
        first_name: firstName,
        last_name: lastName,
        email: email,
        image: picture
      }
      createUser(userInfo);
     }
   }, { scope: "email" });
 });


});
var createUser = function(obj){
  $.ajax({
    url: 'http://localhost:3000/users',
    method:'POST',
    data: obj
  })
  .done(function(response){
    console.log(response);
    var user_id = response.user.id.toString();
    $('#container').addClass(user_id);
    $('#container').removeClass("landing_page");
    if (response.event != null) {
      $('#header').removeAttr('style');
      $('#footer').removeAttr('style');

      template = Handlebars.compile($("#single-event-template").html());
      var desc = "<p>Description: " + response.event.description + "</p>";
      $("#container").html(template(response));
      $('#container a').append(desc);
    }
    else {
      template = Handlebars.compile($("#preferences").html());
      $("#container").html(template(response));
      $("#container > ul").listview().listview("refresh");
    }

  })
  .fail(function(){
    console.log("fail");
  })
}
