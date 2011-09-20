class Strata.Question
  constructor: (@parent, @persister) ->
    @parent.find(".tag .like").click (e) => this.likeElement(e)
    @parent.find(".tag .dislike").click (e) => this.dislikeElement(e)
    @parent.find(".tag .remove").click (e) => this.neutralElement(e)
    @parent.find(".submit").click (e) => this.submit(e)
    @events = $({})

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
    @persister.submit this.toJson(), =>
      @events.trigger("questionSave")

  toJson: ->
    preferences:
      likes: ($(x).find(".tagText").text() for x in @parent.find(".likes .tag"))
      dislikes: ($(x).find(".tagText").text() for x in @parent.find(".dislikes .tag"))
      neutral: ($(x).find(".tagText").text() for x in @parent.find(".neutral .tag"))

  hide: ->
    @parent.find(".selector").addClass("hidden")

  show: ->
    @parent.find(".selector").removeClass("hidden")