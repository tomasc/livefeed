# returns String
format_date = (timestamp) ->
    d = new Date(timestamp)
    d.toString('d/M/yy')
    
# returns String
format_time = (timestamp) ->
    d = new Date(timestamp)
    d.toString('HH:mm')
    
# returns Date
round_to_minutes = (timestamp) ->
    d = new Date(timestamp)
    d = d.toString('MM/dd/yyyy HH:mm')
    d = Date.parse(d)

# returns Array
group_by_minute = (posts) ->
    grouped_posts = _.groupBy posts, (p) ->
        timestamp = p.timestamp
        if timestamp
            d = new Date(timestamp)
            d.toString('M/d/yy HH:mm')

    _.map grouped_posts, (p, i) ->
        [i, p]