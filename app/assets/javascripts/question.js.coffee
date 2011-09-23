class Strata.Question
  constructor: (@parent, @persister) ->
    @parent.find(".tag .like").live "click", (e) => this.likeElement(e)
    @parent.find(".tag .dislike").live "click", (e) => this.dislikeElement(e)
    @parent.find(".tag .remove").live "click", (e) => this.neutralElement(e)
    @parent.find(".submit").click  (e) => this.submit(e)
    @parent.find(".create_tag").click (e) => this.createTag(e)
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

  getChoices: (category) ->
    ($(x).find(".tagText").text() for x in @parent.find(".#{category} .tag"))

  toJson: ->
    preferences:
      likes: this.getChoices("likes")
      dislikes: this.getChoices("dislikes")
      neutral: this.getChoices("neutral")

  hide: ->
    @parent.find(".selector").addClass("hidden")

  show: ->
    @parent.find(".selector").removeClass("hidden")

  allChoices: ->
    [].concat(this.getChoices("likes"), this.getChoices("dislikes"), this.getChoices("neutral"))

  choiceCanBeAdded: (keyword) ->
    return false unless keyword
    return false unless $.inArray(keyword, this.allChoices()) == -1
    true

  createTag: ->
    addKeywordBox = @parent.find(".add_keywords")
    keyword = addKeywordBox.val()
    addKeywordBox.val(null)

    if (this.choiceCanBeAdded(keyword))
      li = this.buildTagLi(keyword)
      @parent.find(".neutral .tags").append(li)


  buildTagLi: (text) ->
    li = $("<li class='tag'></li>")
    li.append($("<a class='like'>like</a>"))
    li.append($("<span class='tagText'>#{text}</span>"))
    li.append($("<a class='dislike'>dislike</a>"))
    li.append($("<a class='remove'>remove</a>"))
    li
