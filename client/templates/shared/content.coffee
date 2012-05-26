Template.content.routed_template = () ->

    switch
        when document.location.href.match(/(\/feeds$)/i)
            Template.feeds()
            
        when document.location.href.match(/(\/feeds\/edit$)/i)
            Template.edit_feeds()
            
        when document.location.href.match(/(\/feeds\/.{36})$/i)
            id = document.location.href.match(/\/feeds\/(.{36})$/i)[1]
            Template.posts { feed_id: id }
            
        when document.location.href.match(/(\/feeds\/.{36})\/new$/i)
            id = document.location.href.match(/\/feeds\/(.{36})\/new$/i)[1]
            if id
                Template.new_post { feed_id: id }