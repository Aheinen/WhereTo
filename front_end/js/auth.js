$(document).ready(function(event) {
  var ref = new Firebase("https://wheretodbc.firebaseIO.com");

  $('#login').on('click', function(e){
   e.preventDefault();
   ref.authWithOAuthPopup("facebook", function(error, authData) {
     if (error) {
       console.log("Login Failed!", error);
     } else {
       console.log(authData.facebook);
       console.log('hello');
       console.log(authData.facebook.email);
     }
   }, { scope: "email" });
 });
});
