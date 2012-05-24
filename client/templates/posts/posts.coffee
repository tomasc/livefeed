Template.posts.posts = ->
    Posts.find({}, { sort: { timestamp: -1 } })