# define Posts collection
Feeds = new Meteor.Collection 'feeds'

# send (publish) all Posts to the client (=browser)
Meteor.publish 'feeds', ->
    Feeds.find({})
