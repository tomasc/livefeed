Posts = new Meteor.Collection 'posts'

Meteor.subscribe 'posts', ->
    Posts.find()
