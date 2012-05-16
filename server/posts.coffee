# define Posts collection
Posts = new Meteor.Collection 'posts'

# send (publish) all Posts to the client (=browser)
Meteor.publish 'posts', ->
    Posts.find({})
