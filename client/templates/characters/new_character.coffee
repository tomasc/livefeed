Template.new_character.events = 
    
    # listen to click on the new character input button
    "click input.submit": (e) ->
        
        # store reference to the input field
        $input = $('input#new-character')
        
        # if any value entered
        if $input.val()
            
            # store it in the characters collection
            Characters.insert { name: $input.val() }
            
            # reset the input field to an empty value
            $input.val('')