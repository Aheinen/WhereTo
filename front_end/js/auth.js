$(document).ready(function(event) {
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
    var user_id = response.user.id.toString();
    $('#container').addClass(user_id);
    $('#container').removeClass("landing_page");

    var url = "http://localhost:3000/categories"

    template = Handlebars.compile($("#preferences").html())

    $.getJSON(url, function(json) {
      $("#container").html(template(json))
      $("#container > ul").listview().listview("refresh")
    }) // end getJSON preferences
  })
  .fail(function(){
    console.log("fail");
  })
}
