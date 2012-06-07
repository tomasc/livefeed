Template.feeds.feeds = ->
    Feeds.find({}, { sort: { date_time: -1 } })