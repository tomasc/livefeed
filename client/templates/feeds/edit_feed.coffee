Template.edit_feed.events =
    "click input#delete-feed": (e) ->
        if confirm('Are you sure?')
            Feeds.remove { _id: this._id }
            Posts.remove { feed_id: this._id }
            Characters.remove { feed_id: this._id }
        
        
Template.edit_feed.posts = ->
    Posts.find({ feed_id: this._id }, { sort: { timestamp: -1 } })
    
Template.edit_feed.characters = ->
    Characters.find({ feed_id: this._id }, { sort: { name: 1 } })