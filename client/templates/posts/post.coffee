Template.post.character_name = ->
    character = Characters.findOne(this.character_id)
    character.name if character