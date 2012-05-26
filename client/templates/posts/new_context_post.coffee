Template.new_context_post.events =
    
    "click input.submit": (e) ->
        $this = $(e.target)

        $input = $this.siblings('textarea#new-context-post')
        input_val = $input.val()

        if input_val
            
            Posts.insert { 
                body: input_val, 
                feed_id: this.feed_id, 
                timestamp: (new Date()).getTime()
            }
            $input.val('')