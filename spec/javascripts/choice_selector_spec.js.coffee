describe 'ChoiceSelector', ->
  selector = null
  beforeEach ->
    loadFixtures("choice_selector.html")
    selector = new Strata.ChoiceSelector(".welcome")

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

  describe 'submitting the response', ->
    it "should create inquiry with neutral responses", ->
      selector.prepareForSubmitting()
      form = $("#createInquiry")
      expect(form.find("select[name='preferences[neutral][]']").val()).toEqual(["Travel", "Fun"])

    it "should create inquiry with like responses", ->
      $(".neutral .tag:first a.like").click()
      selector.prepareForSubmitting()
      form = $("#createInquiry")
      expect(form.find("select[name='preferences[likes][]']").val()).toEqual(["Travel"])
      expect(form.find("select[name='preferences[neutral][]']").val()).toEqual(["Fun"])

    it "should create inquiry with disike responses", ->
      $(".neutral .tag:first a.dislike").click()
      selector.prepareForSubmitting()
      form = $("#createInquiry")
      expect(form.find("select[name='preferences[dislikes][]']").val()).toEqual(["Travel"])
      expect(form.find("select[name='preferences[neutral][]']").val()).toEqual(["Fun"])

  describe "dynamic choice", ->
    it "should updates a dom with new choice when added", ->
      selector.addChoice("Drinking", "neutral")
      expect($(".neutral .tag .tagText:contains('Drinking')")).toExist()
