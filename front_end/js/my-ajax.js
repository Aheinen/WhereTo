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

    $('.single-event-link').click(function(event) {

        event.preventDefault();

        var url = "http://localhost:3000/users/1/events"

        template = Handlebars.compile($("#single-event-template").html())

        $.getJSON(url, function(json) {
           var desc = "<p>Description: " + json.event.description + "</p>";

            $("#container").html(template(json))

            $('#container a').append(desc)
        }) // end getJSON

    }) // end single


    $('.multi-event-link').click(function(event) {

        event.preventDefault();

        var url = "http://localhost:3000/users/1/events"

        template = Handlebars.compile($("#multi-event-template").html())

        $.getJSON(url, function(json) {

            // for (var i = 0; i < json.events.length; i++) {
            //     var old_desc = json.events[i].description;
            //     json.events[i].description = "<p>" + old_desc + "</p>";
            // }

            $("#container").html(template(json))
        }) // end getJSON

    }) // end multi

}); // end document ready

