Characters = new Meteor.Collection 'characters'

Meteor.publish 'characters', ->
    Characters.find()