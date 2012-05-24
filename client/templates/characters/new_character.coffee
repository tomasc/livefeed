Template.new_character.events = 
    
    "click input.submit": (e) ->
        $this = $(e.target)
        
        $input = $this.siblings('input#new-character')
        $feed_select = $this.siblings('select#feed_select')
        
        if $input.val()
            Characters.insert { 
                name: $input.val() 
                feed_id: $feed_select.val()
                key: $input.val().charAt(0).toLowerCase()
            }
            $input.val('')