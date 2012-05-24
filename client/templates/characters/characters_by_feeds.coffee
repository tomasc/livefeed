Template.characters_by_feeds.characters_by_feeds = ->
    Feeds.find({}, {sort: {name: 1}})