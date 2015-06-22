$(document).ready(function(event) {

    $('.single-event-link').click(function(event) {

        event.preventDefault();

        var url = "http://localhost:3000/events"

        template = Handlebars.compile($("#single-event-template").html())

        $.getJSON(url, function(json) {
           var desc = "<p>Description: " + json.event.description + "</p>";
            $("#container").html(template(json))

            $('#container a').append(desc)
        }) // end getJSON

    }) // end single


    $('.multi-event-link').click(function(event) {

        event.preventDefault();

        var url = "http://localhost:3000/events"

        template = Handlebars.compile($("#multi-event-template").html())

        $.getJSON(url, function(json) {

            // for (var i = 0; i < json.events.length; i++) {
            //     var old_desc = json.events[i].description;
            //     json.events[i].description = "<p>" + old_desc + "</p>";
            // }

            $("#container").html(template(json))
            $("#container > ul").listview().listview("refresh")

        }) // end getJSON

    }) // end multi


    $('#trash').click(function(event) {
        event.preventDefault();

        var url = "http://localhost:3000/categories"

        template = Handlebars.compile($("#preferences").html())

        $.getJSON(url, function(json) {
            $("#container").html(template(json))
            $("#container > ul").listview().listview("refresh")
        }) // end getJSON preferences


    }); // end trash event handler


    $('#container').on('click', '.category', function(event) {
        event.preventDefault();

        $(this).addClass("ui-btn-active");
    }) // end preference selection

    // #.off used to prevent double firing of events
    // http://www.gajotres.net/prevent-jquery-multiple-event-triggering/ See Solution 2
    $('#container').off('click', '#submit_preferences').on('click', '#submit_preferences', function(event) {
        event.preventDefault();

        var interests = []
        var items = $('#container').find('li > a')

        $.each(items, function( index, value ) {

            if ($(this).hasClass("ui-btn-active")) {

                interests.push(index);

            } // end if loop
        }); // end each loop

        alert("Category IDs: " + interests);

        var updateInterests = $.ajax({
            type: "patch",
            url: "http://localhost:3000/users/4",
            data: {interests: interests}
        });

        updateInterests.done(function(){
            alert("Yeah!");
        })

        updateInterests.fail(function(){
            alert("aw man");
        })

    }) // end submit preferences

}); // end document ready

