Template.content.routed_template = () ->

    switch
        when document.location.href.match(/(\/feeds$)/i)
            Template.feeds()
        when document.location.href.match(/(\/feeds\/.{36})$/i)
            id = document.location.href.match(/\/feeds\/(.{36})$/i)[1]
            posts = Posts.find { feed_id: id }
            Template.posts(posts)