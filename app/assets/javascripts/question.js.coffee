class Strata.Question
  constructor: (@parent, @persister) ->
    @parent.find(".tag .like").click (e) => this.likeElement(e)
    @parent.find(".tag .dislike").click (e) => this.dislikeElement(e)
    @parent.find(".tag .remove").click (e) => this.neutralElement(e)
    @parent.find(".submit").click (e) => this.submit(e)

  moveElementTo: (container, event) ->
    choice = $(event.target).parents("li")
    @parent.find(".#{container} .tags").append(choice)

  likeElement: (e) ->
    this.moveElementTo("likes", e)

  dislikeElement: (e) ->
    this.moveElementTo("dislikes", e)

  neutralElement: (e) ->
    this.moveElementTo("neutral", e)

  submit: (e) ->
    console.log("hi")
    @persister.submit(this.toJson())

  toJson: ->
    preferences:
      likes: ($(x).find(".tagText").text() for x in @parent.find(".likes .tag"))
      dislikes: ($(x).find(".tagText").text() for x in @parent.find(".dislikes .tag"))
      neutral: ($(x).find(".tagText").text() for x in @parent.find(".neutral .tag"))

class Strata.AsyncPersister
  constructor: (@resourceUrl) ->

  submit: (json) ->
    $.post(@resourceUrl, $.extend(json, { _method: "put" }))
