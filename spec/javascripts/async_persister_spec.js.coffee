describe "AsyncPersister", ->
  persister = null

  beforeEach ->
    persister = new Strata.AsyncPersister("/response/url")

  it "should post a response over ajax", ->
    spyOn($, "ajax").andCallFake (params) ->
      expect(params.url).toEqual("/response/url")
      expect(params.data._method).toEqual("put")
      expect(params.type).toEqual("post")
    persister.submit({})
    expect($.ajax).wasCalled()

  it "should send all preferences in the ajax query", ->
    spyOn($, "ajax").andCallFake (params) ->
      expect(params.data.preferences.neutral).toEqual(["Travel", "Fun"])
    persister.submit({ preferences: { neutral: ["Travel", "Fun"] } } )
    expect($.ajax).wasCalled()
