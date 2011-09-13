class ChoiceSelector
  moveElementTo: (container, event) ->
    choice = $(event.target).parents("li")
    $(".welcome .#{container} .tags").append(choice)

  likeElement: (e) ->
    this.moveElementTo("likes", e)

  dislikeElement: (e) ->
    this.moveElementTo("dislikes", e)

  neutralElement: (e) ->
    this.moveElementTo("neutral", e)

  prepareForSubmitting: ->
    $(".welcome #createInquiry").append(this.createSelectBoxWith("neutral"))
    $(".welcome #createInquiry").append(this.createSelectBoxWith("likes"))
    $(".welcome #createInquiry").append(this.createSelectBoxWith("dislikes"))

  createSelectBoxWith: (name) ->
    elements = ($(x).find(".tagText").text() for x in $(".welcome .#{name} .tag"))
    selectBox = $("<select name='preferences[#{name}][]' multiple></select>")
    for option in elements
      selectBox.append($("<option selected='selected' value='#{option}'>#{option}</option>"))
    selectBox

  submit: (e) ->
    this.prepareForSubmitting()
    $(".welcome #createInquiry").submit()

  constructor: ->
    $(".welcome .tag .like").click (e) => this.likeElement(e)
    $(".welcome .tag .dislike").click (e) => this.dislikeElement(e)
    $(".welcome .tag .remove").click (e) => this.neutralElement(e)
    $(".welcome .submit").click (e) => this.submit(e)


Strata.Welcome =
  bootstrap: ->
    # Saved only for tests
    Strata.Welcome.choiceSelector = new ChoiceSelector()
