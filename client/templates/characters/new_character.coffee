Template.new_character.events = 
    "click input#new-character": (e) ->
        $this = $(e.target)
        
        $input = $this.siblings('input#character-name')
        
        if $input.val()
            Characters.insert { 
                name: $input.val() 
                feed_id: this._id
                key: $input.val().charAt(0).toLowerCase()
            }
            $input.val('')