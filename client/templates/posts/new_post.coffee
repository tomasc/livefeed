Template.new_post.feed_name = () ->
    feed = Feeds.findOne(this.feed_id)
    feed.name if feed
    
Template.new_post.characters = () ->
    Characters.find({ feed_id: this.feed_id }, { sort: { name: 1 } })
    