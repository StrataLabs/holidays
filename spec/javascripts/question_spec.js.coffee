describe "Question", ->
  beforeEach ->
    loadFixtures("choice_selector.html")
    selector = new Strata.Question($(".welcome"))

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
