class ChoiceSelector
  getTag: (event) ->
    $(event.target).parents("li")

  likeElement: (e) ->
    choice = this.getTag e
    $(".likes .tags").append(choice)

  dislikeElement: (e) ->
    choice = this.getTag e
    $(".dislikes .tags").append(choice)

  ambivalentElement: (e) ->
    choice = this.getTag e
    $(".choices .tags").append(choice)

  constructor: ->
    $(".tag .like").click (e) => this.likeElement(e)
    $(".tag .dislike").click (e) => this.dislikeElement(e)
    $(".tag .remove").click (e) => this.ambivalentElement(e)

Strata.Welcome =
  bootstrap: ->
    new ChoiceSelector()
