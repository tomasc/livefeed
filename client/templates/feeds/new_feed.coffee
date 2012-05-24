Template.new_feed.events = 
    
    "click input.submit": (e) ->
        
        $input = $('input#new-feed')
        
        if $input.val()
            Feeds.insert { name: $input.val() }
            $input.val('')
            