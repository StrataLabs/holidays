class Strata.Question
  constructor: (@parent) ->
    @parent.find(".tag .like").click (e) => this.likeElement(e)
    @parent.find(".tag .dislike").click (e) => this.dislikeElement(e)
    @parent.find(".tag .remove").click (e) => this.neutralElement(e)

  moveElementTo: (container, event) ->
    choice = $(event.target).parents("li")
    @parent.find(".#{container} .tags").append(choice)

  likeElement: (e) ->
    this.moveElementTo("likes", e)

  dislikeElement: (e) ->
    this.moveElementTo("dislikes", e)

  neutralElement: (e) ->
    this.moveElementTo("neutral", e)
