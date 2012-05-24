Characters = new Meteor.Collection 'characters'

Meteor.subscribe 'characters', ->
    Characters.find({})
