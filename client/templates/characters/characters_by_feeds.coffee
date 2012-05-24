Template.characters_by_feeds.feeds = ->
    Feeds.find({}, {sort: {name: 1}})