# if the database is empty on server start, create some sample data.

Meteor.startup ->
    if Posts.find().count() == 0
        data = [
            { body: 'hello' },
            { body: 'David' }
        ]
        
        timestamp = (new Date()).getTime()
        
        for post in data
            do (post) ->
                Posts.insert { body: post['body'], timestamp: timestamp }
                timestamp += 1

