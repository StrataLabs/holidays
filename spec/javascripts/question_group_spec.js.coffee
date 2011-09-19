
describe "QuestionGroup", ->
  group = null
  beforeEach ->
    group = new Strata.QuestionGroup()

  stubQuestion = ->
    question =
      show: -> "foo"
      hide: -> "bar"
    spyOn(question, "show")
    spyOn(question, "hide")
    question

  it "contains a list of questions", ->
    group.add(new Strata.Question($(".welcome_1"), "persister_1"))
    group.add(new Strata.Question($(".welcome_2"), "persister_2"))
    expect(group.questions.length).toEqual(2)

  it "preserves the order of questions in the group", ->
    group.add(new Strata.Question($(".welcome_1"), "persister_1"))
    group.add(new Strata.Question($(".welcome_2"), "persister_2"))
    expect(group.questions[0].persister).toEqual("persister_1")
    expect(group.questions[1].persister).toEqual("persister_2")

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
