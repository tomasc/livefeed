


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
    d = new Date(this.date_time)
    
    day = d.getDate().toString()
    # day = "0#{day}" if day.length == 1
    
    month = d.getMonth().toString()
    # month = "0#{month}" if month.length == 1
    
    "#{day}/#{month}/#{d.getFullYear().toString().substr(2)}"


    
Template.feed.time_string = () ->
    d = new Date(this.date_time)

    h = d.getHours().toString()
    h = "0#{h}" if h.length == 1
    
    min = d.getMinutes().toString()
    min = "0#{min}" if min.length == 1

    "#{h}:#{min}"