$('#formModal').on('submit', function(event) {
  event.preventDefault();

  var theContent = $('input[name="content"]').val();

  var post_question = $.ajax({
    type: 'post',
    url: 'http://localhost:1337/questions',
    data: {question: {content: theContent}},
    dataType: 'JSON'
    }) // post question ajax

  post_question.done(function(data) {
    alert('hot dog!')
  }) // post question done promise

})

$('.all_questions').on('click', function(event) {
  event.preventDefault();

  $.getJSON( "http://localhost:1337/api/questions" )
    .done(function(json) {
      $('.container').html(
        "yo"
        )
      console.log(json);
    })
    .fail(function( jqxhr, textStatus, error ) {
      var err = textStatus + ", " + error;
      console.log( "Request Failed: " + err );
  });
}) // all questions event handler