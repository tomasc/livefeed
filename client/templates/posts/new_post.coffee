Template.new_post.events =
    
    "click input.submit": (e) ->
        $this = $(e.target)

        $input = $this.siblings('input#new-post')
        input_val = $input.val()

        if input_val and input_val.match(/^(.\s)/i)
            
            character_key = input_val.charAt(0).toLowerCase()
            character = Characters.findOne { key: character_key, feed_id: this.feed_id }
            
            if character
                Posts.insert { 
                    body: input_val.substr(2), 
                    character_id: character._id,
                    feed_id: this.feed_id, 
                    timestamp: (new Date()).getTime() 
                }
                $input.val('')



Template.new_post.feed_name = () ->
    feed = Feeds.findOne(this.feed_id)
    feed.name if feed
    
Template.new_post.characters = () ->
    Characters.find({ feed_id: this.feed_id }, { sort: { name: 1 } })
    