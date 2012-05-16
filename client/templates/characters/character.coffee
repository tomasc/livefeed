Template.character.events = 
    
    # listen to click on the new character input button
    "click input.submit": (e) ->
        
        Characters.remove { _id: this._id }
        Posts.remove { character_id: this._id }