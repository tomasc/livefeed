Template.characters_by_feed.characters_by_feed = ->
    Characters.find { feed_id: this._id }, { sort: { name: 1 } }