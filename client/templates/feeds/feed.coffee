


Template.feed.number_of_posts = ->
    Posts.find({feed_id: this._id}).count()
    
    
    
Template.feed.characters = () ->
    Characters.find({ feed_id: this._id }, { sort: { name: 1 } })
    
    
    
Template.feed.date_string = () ->
    d = new Date(this.date_time)
    
    day = d.getDate().toString()
    day = "0#{day}" if day.length == 1
    
    month = d.getMonth().toString()
    month = "0#{month}" if month.length == 1
    
    "#{day}/#{month}/#{d.getFullYear()}"
    
Template.feed.time_string = () ->
    d = new Date(this.date_time)

    h = d.getHours().toString()
    h = "0#{h}" if h.length == 1
    
    min = d.getMinutes().toString()
    min = "0#{min}" if min.length == 1

    "#{h}:#{min}"