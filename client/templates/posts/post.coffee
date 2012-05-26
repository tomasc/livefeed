Template.post.character_name = ->
    character = Characters.findOne(this.character_id)
    character.name if character
    
Template.post.feed_name = ->
    feed = Feeds.findOne(this.feed_id)
    feed.name if feed
    
Template.post.timestamp_date = ->
    d = new Date(this.timestamp)
    "#{d.getDate()}/#{d.getMonth()}/#{d.getUTCFullYear()}"
    
Template.post.timestamp_time = ->
    d = new Date(this.timestamp)
    "#{d.getHours()}:#{d.getMinutes()}"