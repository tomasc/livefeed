Template.feeds.feeds = ->
    Feeds.find({}, { sort: { timestamp: -1 } })