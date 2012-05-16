# ---------------------------------------------------------------------
# POSTS



# define the Posts collection
Posts = new Meteor.Collection 'posts'

# subscribe to updates of all posts on the server
Meteor.subscribe 'posts', ->
    Posts.find({})



# ---------------------------------------------------------------------
# CHARACTERS



# define the Characters collection
Characters = new Meteor.Collection 'characters'

# subscribe to updates of all characters on the server
Meteor.subscribe 'characters', ->
    Characters.find({})
