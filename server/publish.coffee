Posts = new Meteor.Collection 'posts'

Meteor.publish 'posts', ->
    Posts.find()