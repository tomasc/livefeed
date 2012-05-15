Template.posts.events = 
    "click input.submit": (e) ->
        $input = $('#new-post-box input#new-post')
        if $input.val()
            Posts.insert { body: $input.val(), timestamp: (new Date()).getTime() }
            $input.val('')