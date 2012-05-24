Template.new_post.events =
    
    "click input.submit": (e) ->
        $this = $(e.target)

        $input = $this.siblings('input#new-post')
        $character_select = $this.siblings('select#character_select')
        $feed_select = $this.siblings('select#feed_select')
        
        if $input.val()
            Posts.insert { 
                body: $input.val(), 
                character_id: $character_select.val(),
                feed_id: $feed_select.val(), 
                timestamp: (new Date()).getTime() 
            }
            $input.val('')