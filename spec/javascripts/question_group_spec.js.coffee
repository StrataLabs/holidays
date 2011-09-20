
describe "QuestionGroup", ->
  group = null
  beforeEach ->
    group = new Strata.QuestionGroup()

  stubQuestion = (name) ->
    question =
      name: name
      show: -> "foo"
      hide: -> "bar"
      events: $({})
    spyOn(question, "show")
    spyOn(question, "hide")
    question

  it "contains a list of questions", ->
    group.add(stubQuestion())
    group.add(stubQuestion())
    expect(group.questions.length).toEqual(2)

  it "preserves the order of questions in the group", ->
    group.add(stubQuestion(1))
    group.add(stubQuestion(2))
    expect(group.questions[0].name).toEqual(1)
    expect(group.questions[1].name).toEqual(2)

  it "does not hide the first question when adding", ->
    question = stubQuestion()
    group.add(question)
    expect(question.hide).not.toHaveBeenCalled()

  it "hides the second question onwards", ->
    group.add(q1 = stubQuestion())
    group.add(q2 = stubQuestion())
    expect(q2.hide).toHaveBeenCalled()

  it "moves to the next question", ->
    group.add(q1 = stubQuestion())
    group.add(q2 = stubQuestion())
    group.next()
    expect(q1.hide).toHaveBeenCalled()
    expect(q2.show).toHaveBeenCalled()

  it "stays on last question when called next", ->
    group.add(q1 = stubQuestion())
    group.next()
    expect(q1.hide).not.toHaveBeenCalled()

  it "shows the next question when questionSave is triggered", ->
    group.add(q1 = stubQuestion())
    group.add(q2 = stubQuestion())
    q1.events.trigger("questionSave")
    expect(q1.hide).toHaveBeenCalled()
    expect(q2.show).toHaveBeenCalled()