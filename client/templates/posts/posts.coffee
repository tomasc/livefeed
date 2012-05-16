# assign all posts (sorted in descending order) to the 'posts' variable in this template
Template.posts.posts = ->
    Posts.find({}, { sort: { timestamp: -1 } })