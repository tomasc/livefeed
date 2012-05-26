Template.posts.posts = ->
    Posts.find({ feed_id: this.feed_id }, { sort: { timestamp: -1 } })
    
Template.posts.feed_name = () ->
    feed = Feeds.findOne(this.feed_id)
    feed.name if feed

Template.posts.characters = () ->
    Characters.find({ feed_id: this.feed_id }, { sort: { name: 1 } })