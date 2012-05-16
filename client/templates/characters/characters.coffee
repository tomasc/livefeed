# assign all characters (sorted in descending order) to the 'characters' variable in this template
Template.characters.characters = ->
    Characters.find({}, {sort: {name: 1}})