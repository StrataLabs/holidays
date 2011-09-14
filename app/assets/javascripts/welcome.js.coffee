class ChoiceSelector
  moveElementTo: (container, event) ->
    choice = $(event.target).parents("li")
    $("#{@parent} .#{container} .tags").append(choice)

  likeElement: (e) ->
    this.moveElementTo("likes", e)

  dislikeElement: (e) ->
    this.moveElementTo("dislikes", e)

  neutralElement: (e) ->
    this.moveElementTo("neutral", e)

  prepareForSubmitting: ->
    $("#{@parent} #createInquiry").append(this.createSelectBoxWith("neutral"))
    $("#{@parent} #createInquiry").append(this.createSelectBoxWith("likes"))
    $("#{@parent} #createInquiry").append(this.createSelectBoxWith("dislikes"))

  createSelectBoxWith: (name) ->
    elements = ($(x).find(".tagText").text() for x in $("#{@parent} .#{name} .tag"))
    selectBox = $("<select name='preferences[#{name}][]' multiple></select>")
    for option in elements
      selectBox.append($("<option selected='selected' value='#{option}'>#{option}</option>"))
    selectBox

  submit: (e) ->
    this.prepareForSubmitting()
    $("#{@parent} #createInquiry").submit()

  constructor: (@parent) ->
    $("#{@parent} .tag .like").click (e) => this.likeElement(e)
    $("#{@parent} .tag .dislike").click (e) => this.dislikeElement(e)
    $("#{@parent} .tag .remove").click (e) => this.neutralElement(e)
    $("#{@parent} .submit").click (e) => this.submit(e)


Strata.Welcome =
  bootstrap: (container)->
    # Saved only for tests
    Strata.Welcome.choiceSelector = new ChoiceSelector(container)
