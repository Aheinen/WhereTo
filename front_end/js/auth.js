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
    console.log(response);
  })
  .fail(function(){
    console.log("fail");
  })
}
