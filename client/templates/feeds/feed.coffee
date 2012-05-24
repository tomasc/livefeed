Template.feed.events =
    "click input.submit": (e) ->
        Feeds.remove { _id: this._id }
        Posts.remove { feed_id: this._id }
        Characters.remove { feed_id: this._id }
        
        
Template.feed.posts = ->
    Posts.find({ feed_id: this._id }, { sort: { timestamp: -1 } })