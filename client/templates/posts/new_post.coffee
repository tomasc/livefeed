Template.new_post.events = 
    
    # listen to click on the new post input button
    "click input.submit": (e) ->
        
        # store reference to the input field
        $input = $('input#new-post')
        
        # if any value entered
        if $input.val()
            
            # store it in the post collection, along with a timestamp 
            # (so that we can later sort the posts)
            Posts.insert { body: $input.val(), timestamp: (new Date()).getTime() }
            
            # reset the input field to an empty value
            $input.val('')