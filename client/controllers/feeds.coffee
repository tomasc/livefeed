Feeds = new Meteor.Collection 'feeds'

Meteor.subscribe 'feeds', ->
    Feeds.find({})