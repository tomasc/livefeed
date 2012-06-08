Template.feed.events =
    "click tr.feed": (e) ->
        e.preventDefault()
        $tr = $(e.currentTarget)
        feed_id = $tr.data('feed-id')
        document.location.href = "/feeds/#{feed_id}"
        
    "click div.nav.next": (e) ->
        e.preventDefault()
        counter = Session.get 'counter'
        Session.set 'counter', counter-1


Template.feed.number_of_posts = ->
    Posts.find({feed_id: this._id}).count()
    
    
    
Template.feed.characters = () ->
    Characters.find({ feed_id: this._id }, { sort: { name: 1 } })
    


Template.feed.time = () ->
    # first_post = Posts.findOne({ feed_id: this._id }, { sort: { timestamp: -1 } })
    last_post = Posts.findOne({ feed_id: this._id }, { sort: { timestamp: 1 } })
    
    if last_post
        # d1 = new Date(first_post.timestamp)
        d1 = new Date(this.date_time)
        d2 = new Date(last_post.timestamp)
    
        diff = new Date(d1 - d2)
        
        h = diff.getHours().toString()
        h = "0#{h}" if h.length == 1
        
        min = diff.getMinutes().toString()
        min = "0#{min}" if min.length == 1
    
        "#{h} hr #{min} min"



Template.feed.date_string = () ->
    format_date(this.date_time)
    
Template.feed.time_string = () ->
    format_time(this.date_time)
