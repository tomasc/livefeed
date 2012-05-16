Template.new_post.events = 
    "click input.submit": (e) ->
        $input = $('input#new-post')
        if $input.val()
            Posts.insert { body: $input.val(), timestamp: (new Date()).getTime() }
            $input.val('')