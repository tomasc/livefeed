Template.edit_feed.events =
    "click input#delete-feed": (e) ->
        if confirm('Are you sure?')
            Feeds.remove { _id: this._id }
            Posts.remove { feed_id: this._id }
            Characters.remove { feed_id: this._id }
            
    "click input#update-feed": (e) ->
        $this = $(e.target)
        $input = $this.siblings('#feed_name')
        
        input_val = $input.val()
        if input_val
            Feeds.update({ _id: this._id }, { $set: {name: input_val} })
            
    "click input#update-date_time": (e) ->
        $this = $(e.target)
        $input = $this.siblings('#date_time')

        input_val = $input.val()
        parts = input_val.match(/(\d+)/g)

        d = new Date()
        d.setFullYear parts[0]
        d.setMonth parts[1]
        d.setDate parts[2]
        d.setHours parts[3]
        d.setMinutes parts[4]

        if input_val
            Feeds.update({ _id: this._id }, { $set: {date_time: d.getTime()} })



# ---------------------------------------------------------------------
        
        
        
Template.edit_feed.posts = ->
    Posts.find({ feed_id: this._id }, { sort: { timestamp: -1 } })


    
Template.edit_feed.characters = ->
    Characters.find({ feed_id: this._id }, { sort: { name: 1 } })


    
Template.edit_feed.has_posts = ->
    Posts.find({feed_id: this._id}).count() > 0
    
    
    
Template.edit_feed.date_time_string = ->
    d = new Date(this.date_time)
    
    day = d.getDate().toString()
    day = "0#{day}" if day.length == 1
    
    month = d.getMonth().toString()
    month = "0#{month}" if month.length == 1
    
    h = d.getHours().toString()
    h = "0#{h}" if h.length == 1
    
    min = d.getMinutes().toString()
    min = "0#{min}" if min.length == 1
    
    "#{d.getFullYear()}-#{month}-#{day}T#{h}:#{min}Z"