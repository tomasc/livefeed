Template.new_feed.events = 
    
    "click input#new-feed[type=button]": (e) ->
        
        $input = $('input#feed-name')
        
        if $input.val()
            Feeds.insert { name: $input.val(), date_time: (new Date()).getTime() }
            $input.val('')
            