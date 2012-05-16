# if the database is empty on server start, create some sample data

Meteor.startup ->
    
    # is the db empty
    if Posts.find().count() == 0
        
        # define some initial data
        data = [
            { body: 'hello' },
            { body: 'David' }
        ]
        
        # set timsetamp
        timestamp = (new Date()).getTime()
        
        # loop through all data, store each in the post variable
        for post in data

            # for each post
            do (post) ->

                # insert it in the database, along with a timestamp
                Posts.insert { body: post['body'], timestamp: timestamp }

                # increment the timestamp by 1
                # (since this code runs all at once, all posts would otherwise have the same timestamp)
                timestamp += 1

