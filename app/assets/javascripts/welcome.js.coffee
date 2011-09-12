class ChoiceSelector
  likeElement: (e) ->
    choice = $(e.target).parents("li")
    $(".likes .tags").append(choice)

  dislikeElement: (e) ->
    choice = $(e.target).parents("li")
    $(".dislikes .tags").append(choice)

  constructor: ->
    $(".choices .tag .like").click (e) => this.likeElement(e)
    $(".choices .tag .dislike").click (e) => this.dislikeElement(e)

Strata.Welcome =
  bootstrap: ->
    new ChoiceSelector()
