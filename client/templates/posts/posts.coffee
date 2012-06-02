Template.posts.posts = ->
    Posts.find({ feed_id: this.feed_id }, { sort: { timestamp: 1 } })
    
Template.posts.feed_name = () ->
    feed = Feeds.findOne(this.feed_id)
    feed.name if feed

Template.posts.characters = () ->
    Characters.find({ feed_id: this.feed_id }, { sort: { name: 1 } })
    
Template.posts.situation_posts = () ->
    Posts.find({ feed_id: this.feed_id, post_type: 'situation' }, { sort: { timestamp: -1 } })
    
Template.posts.cast_posts = () ->
    Posts.find({ feed_id: this.feed_id, post_type: 'character' }, { sort: { timestamp: -1 } })
    
Template.posts.opinion_posts = () ->
    Posts.find({ feed_id: this.feed_id, post_type: 'opinion' }, { sort: { timestamp: -1 } })
    
    
Template.posts.date_string = () ->
    feed = Feeds.findOne(this.feed_id)

    if feed
        d = new Date(feed.date_time)

        day = d.getDate().toString()
        day = "0#{day}" if day.length == 1

        month = d.getMonth().toString()
        month = "0#{month}" if month.length == 1

        "#{day}/#{month}/#{d.getFullYear()}"

Template.posts.time_string = () ->
    feed = Feeds.findOne(this.feed_id)

    if feed
        d = new Date(feed.date_time)

        h = d.getHours().toString()
        h = "0#{h}" if h.length == 1

        min = d.getMinutes().toString()
        min = "0#{min}" if min.length == 1

        "#{h}:#{min}"