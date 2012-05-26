Template.feed.number_of_posts = ->
    Posts.find({feed_id: this._id}).count()