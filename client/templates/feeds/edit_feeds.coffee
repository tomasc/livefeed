Template.edit_feeds.feeds = ->
    Feeds.find({}, { sort: { name: 1 } })