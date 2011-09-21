describe "Detail", ->
  selector = null
  beforeEach ->
    loadFixtures("detail.html")
    selector = new Strata.Detail($(".detail"), '/path/to/save')

  describe "submitting responses", ->
    it "submits the response", ->
      spyOn($, "ajax").andCallFake (params) ->
        expect(params.url).toEqual("/path/to/save")
        expect(params.type).toEqual("post")
      $(".submit").click()
      expect($.ajax).toHaveBeenCalled()

    it "sends the selected values from the screen", ->
      spyOn($, "ajax").andCallFake (params) ->
        expect(params.data.detail).toEqual
          number_of_people: "3"
          duration: "1 day"
          time_of_travel: "January"
          group_type: "Family"
      $(".submit").click()
      expect($.ajax).toHaveBeenCalled()

    describe "disable select boxes", ->
      it "disables all select boxes by default", ->
        ["number_of_people", "duration", "time_of_travel", "group_type"].forEach (sel) ->
          expect($("#detail_#{sel}")).toHaveAttr("disabled")

      it "becomes enabled on clicking edit", ->
        $(".edit").click()
        ["number_of_people", "duration", "time_of_travel", "group_type"].forEach (sel) ->
          expect($("#detail_#{sel}")).not.toHaveAttr("disabled")
