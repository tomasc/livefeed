Template.character.events = 
    "click input.submit": (e) ->
        if confirm('Are you sure?')
            Characters.remove { _id: this._id }
            Posts.remove { character_id: this._id }


        
Template.character.feed_name = ->
    feed = Feeds.findOne { _id: this.feed_id }
    feed.name if feed
    