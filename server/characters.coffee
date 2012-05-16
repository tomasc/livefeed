# define Characters collection
Characters = new Meteor.Collection 'characters'

# send (publish) all Characters to the client (=browser)
Meteor.publish 'characters', ->
    Characters.find({})
