# ---------------------------------------------------------------------



Template.new_post.feed_name = () ->
    feed = Feeds.findOne(this.feed_id)
    feed.name if feed

Template.new_post.date_string = () ->
    feed = Feeds.findOne(this.feed_id)

    if feed
        d = new Date(feed.date_time)

        day = d.getDate().toString()
        day = "0#{day}" if day.length == 1

        month = d.getMonth().toString()
        month = "0#{month}" if month.length == 1

        "#{day}/#{month}/#{d.getFullYear()}"

Template.new_post.time_string = () ->
    feed = Feeds.findOne(this.feed_id)

    if feed
        d = new Date(feed.date_time)

        h = d.getHours().toString()
        h = "0#{h}" if h.length == 1

        min = d.getMinutes().toString()
        min = "0#{min}" if min.length == 1

        "#{h}:#{min}"

# ---------------------------------------------------------------------



Template.new_post.characters = () ->
    Characters.find({ feed_id: this.feed_id }, { sort: { name: 1 } })



# ---------------------------------------------------------------------



Template.new_post.last_post_character = () ->
    last_post = Posts.findOne({ feed_id: this.feed_id, post_type: 'character' }, { sort: { timestamp: -1 } })
    Template.last_post last_post if last_post
    
Template.new_post.last_post_situation = () ->
    last_post = Posts.findOne({ feed_id: this.feed_id, post_type: 'situation' }, { sort: { timestamp: -1 } })
    Template.last_post last_post if last_post
    
Template.new_post.last_post_opinion = () ->
    last_post = Posts.findOne({ feed_id: this.feed_id, post_type: 'opinion' }, { sort: { timestamp: -1 } })
    Template.last_post last_post if last_post



# ---------------------------------------------------------------------



Template.new_post.events =

    "click input.submit": (e) ->
        $this = $(e.target)
        $input = $this.siblings('textarea')
        
        post_type = $input.attr('id')
        input_val = $input.val()
        character_id = null
        
        if input_val
            if input_val.match(/^(.\s)/i)
                character_key = input_val.charAt(0).toLowerCase()
                character = Characters.findOne { key: character_key, feed_id: this.feed_id }
                character_id = character._id
                input_val = input_val.substr(2)
            
            Posts.insert { 
                body: input_val, 
                character_id: character_id,
                feed_id: this.feed_id, 
                timestamp: (new Date()).getTime(),
                post_type: post_type
            }
            $input.val('')
