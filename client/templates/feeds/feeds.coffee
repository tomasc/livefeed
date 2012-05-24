Template.feeds.feeds = ->
    Feeds.find({}, { sort: { name: 1 } })