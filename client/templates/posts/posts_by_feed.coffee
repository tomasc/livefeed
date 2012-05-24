Template.posts_by_feed.posts_by_feed = ->
    Posts.find { feed_id: this._id }, { sort: { timestamp: -1 } }