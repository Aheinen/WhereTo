// $('#formModal').on('submit', function(event) {
//   event.preventDefault();

//   var theContent = $('input[name="content"]').val();

//   var post_question = $.ajax({
//     type: 'post',
//     url: 'http://localhost:1337/questions',
//     data: {question: {content: theContent}},
//     dataType: 'JSON'
//     }) // post question ajax

//   post_question.done(function(data) {
//     alert('hot dog!')
//   }) // post question done promise

// })

$(document).ready(function(event) {
  var url = "http://localhost:3000/users/1/events"

  template = Handlebars.compile($("#event-tpl").html())

  $.getJSON(url, function(json) {
      var desc = "<p>" + json.event.description + "</p>";

      $("#event-container").html(template(json))

      $('#event-container a').append(desc)
    })
}); // end document ready
