describe "FormPersister", ->
  persister = null
  form = null

  beforeEach ->
    form = $("<form></form>")
    persister = new Strata.FormPersister(form)

  it "should create inquiry with neutral responses", ->
    persister.buildForm({preferences: { neutral: ["Travel", "Fun"], likes: ["Talking"], dislikes: ["Thinking"] }})
    expect(form.find("select[name='preferences[neutral][]']").val()).toEqual(["Travel", "Fun"])
    expect(form.find("select[name='preferences[likes][]']").val()).toEqual(["Talking"])
    expect(form.find("select[name='preferences[dislikes][]']").val()).toEqual(["Thinking"])

