Template.post.character_name = ->
    character = Characters.findOne(this.character_id)
    character.name if character


    
Template.post.feed_name = ->
    feed = Feeds.findOne(this.feed_id)
    feed.name if feed


    
Template.post.timestamp_date = ->
    format_date(this.timestamp)    
    
Template.post.timestamp_time = ->
    format_time(this.timestamp)