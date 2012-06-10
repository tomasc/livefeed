Session.set 'counter', 0



Template.posts.events =
    "click div.nav.prev": (e) ->
        e.preventDefault()
        counter = Session.get 'counter'
        Session.set 'counter', counter+1
        
    "click div.nav.next": (e) ->
        e.preventDefault()
        counter = Session.get 'counter'
        Session.set 'counter', counter-1



Template.posts.posts = ->
    Posts.find({ feed_id: this.feed_id }, { sort: { timestamp: 1 } })


    
Template.posts.feed_name = () ->
    feed = Feeds.findOne(this.feed_id)
    feed.name if feed
    
Template.posts.feed_date = () ->
    feed = Feeds.findOne(this.feed_id)
    format_date(feed.date_time) if feed



Template.posts.characters = () ->
    Characters.find({ feed_id: this.feed_id }, { sort: { name: 1 } })
    
    
    
Template.posts.situation_posts = () ->
    posts = Posts.find({ feed_id: this.feed_id }, { sort: { timestamp: -1 } }).fetch()
    if posts.length > 0
        counter = Session.get('counter')
        _.filter group_by_minute(posts)[counter][1], (p) ->
            p.post_type == 'situation'
        
    
    
    
Template.posts.cast_posts = () ->
    posts = Posts.find({ feed_id: this.feed_id }, { sort: { timestamp: -1 } }).fetch()
    if posts.length > 0
        counter = Session.get('counter')
        _.filter group_by_minute(posts)[counter][1], (p) ->
            p.post_type == 'character'
    
    
    
Template.posts.opinion_posts = () ->
    posts = Posts.find({ feed_id: this.feed_id }, { sort: { timestamp: -1 } }).fetch()
    if posts.length > 0
        counter = Session.get('counter')
        _.filter group_by_minute(posts)[counter][1], (p) ->
            p.post_type == 'opinion'



Template.posts.has_next = () ->
    counter = Session.get('counter')
    counter > 0
    
Template.posts.has_prev = () ->
    posts = Posts.find({ feed_id: this.feed_id }, { sort: { timestamp: -1 } }).fetch()
    if posts.length > 0
        counter = Session.get('counter')
        counter < group_by_minute(posts).length-1



Template.posts.time_string = () ->    
    posts = Posts.find({ feed_id: this.feed_id }, { sort: { timestamp: -1 } }).fetch()
    if posts.length > 0
        counter = Session.get('counter')
        group_by_minute(posts)[counter][0].split(' ')[1]
