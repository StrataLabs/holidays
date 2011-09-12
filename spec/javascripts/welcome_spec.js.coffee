describe 'Welcome', ->
  beforeEach ->
    loadFixtures("welcome.html")
    Strata.Welcome.bootstrap()

  describe 'like and dislike', ->
    it "should move a tag to like section when like is clicked", ->
      $(".choices .tag a.like").click()
      expect($(".likes .tag .tagText")).toHaveText("Travel")
      expect($(".choices .tag")).not.toExist()

    it "should move a tag to dislike section when dislike is clicked", ->
      $(".choices .tag a.dislike").click()
      expect($(".dislikes .tag .tagText")).toHaveText("Travel")
      expect($(".choices .tag")).not.toExist()

    it "should move a tag back to choices when remove is clicked on a liked tag", ->
      $(".choices .tag a.like").click()
      $(".likes .tag a.remove").click()
      expect($(".choices .tag .tagText")).toHaveText("Travel")
      expect($(".likes .tag")).not.toExist()
