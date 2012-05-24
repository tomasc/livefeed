Template.posts_by_feeds.feeds = ->
    Feeds.find({}, { sort: { timestamp: -1 } })