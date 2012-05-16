Template.new_post.events = 
    
    # listen to click on the new post input button
    "click input.submit": (e) ->
        
        # store reference to the input field
        $input = $('input#new-post')
        $select = $('select#character_select')
        
        # if any value entered
        if $input.val()
            
            # store it in the post collection, along with a timestamp 
            # (so that we can later sort the posts)
            Posts.insert { body: $input.val(), character_id: $select.val(), timestamp: (new Date()).getTime() }
            
            # reset the input field to an empty value
            $input.val('')