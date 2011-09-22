describe "Question", ->
  selector = null
  beforeEach ->
    loadFixtures("choice_selector.html")
    selector = new Strata.Question($(".welcome"), new Strata.AsyncPersister("/response/save/url"))

  describe 'like and dislike', ->
    it "should move a tag to like section when like is clicked", ->
      $(".neutral .tag:first a.like").click()
      expect($(".likes .tag .tagText")).toHaveText("Travel")
      expect($(".neutral .tag .tagText:contains('Travel')")).not.toExist()

    it "should move a tag to dislike section when dislike is clicked", ->
      $(".neutral .tag:first a.dislike").click()
      expect($(".dislikes .tag .tagText")).toHaveText("Travel")
      expect($(".neutral .tag .tagText:contains('Travel')")).not.toExist()

    it "should move a tag back to neutral when remove is clicked on a liked tag", ->
      $(".neutral .tag:first a.like").click()
      $(".likes .tag a.remove").click()
      expect($(".neutral .tag .tagText:contains('Travel')")).toExist()
      expect($(".likes .tag .tagText:contains('Travel')")).not.toExist()

  describe "serialize", ->
    it "should know how to serialize data in json format", ->
      $(".neutral .tag:first a.like").click()
      expect(selector.toJson()).toEqual({preferences: {likes:["Travel"], neutral:["Fun"], dislikes:[]} })

    it "serializes all dislikes", ->
      $(".neutral .tag:first a.dislike").click()
      expect(selector.toJson()).toEqual({preferences: {likes:[], neutral:["Fun"], dislikes:["Travel"]} })

  describe "save", ->
    it "should post a response over ajax", ->
      spyOn($, "ajax").andCallFake (params) ->
        expect(params.url).toEqual("/response/save/url")
        expect(params.data._method).toEqual("put")
        expect(params.type).toEqual("post")
      $(".submit").click()
      expect($.ajax).wasCalled()

    it "should send all preferences in the ajax query", ->
      spyOn($, "ajax").andCallFake (params) ->
        expect(params.data.preferences.neutral).toEqual(["Travel", "Fun"])
      $(".submit").click()
      expect($.ajax).wasCalled()

    it "triggers an event on saving the question", ->
      spyOnEvent(selector.events, 'questionSave')
      spyOn($, "ajax").andCallFake (params) ->
        params.success()
      $(".submit").click()
      expect("questionSave").toHaveBeenTriggeredOn(selector.events)

  describe "show and hide", ->
    it "should hide the selectors", ->
      selector.hide()
      expect($(".selector")).toHaveClass("hidden")

    it "shows the selectors", ->
      selector.hide()
      selector.show()
      expect($(".selector")).not.toHaveClass("hidden")

  describe "add a tag", ->
    it "adds the entered choice into neutral category", ->
      $(".add_keywords").val "goa"
      $(".create_tag").click()
      expect($(".neutral .tag .tagText:contains('goa')")).toExist()
