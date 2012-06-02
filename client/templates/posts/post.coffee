Template.post.character_name = ->
    character = Characters.findOne(this.character_id)
    character.name if character


    
Template.post.feed_name = ->
    feed = Feeds.findOne(this.feed_id)
    feed.name if feed


    
Template.post.timestamp_date = ->
    d = new Date(this.timestamp)
    
    day = d.getDate().toString()
    day = "0#{day}" if day.length == 1
    
    month = d.getMonth().toString()
    month = "0#{month}" if month.length == 1
    
    "#{day}/#{month}/#{d.getUTCFullYear()}"
    
    
    
Template.post.timestamp_time = ->
    d = new Date(this.timestamp)
    
    h = d.getHours().toString()
    h = "0#{h}" if h.length == 1
    
    min = d.getMinutes().toString()
    min = "0#{min}" if min.length == 1
    
    "#{h}:#{min}"