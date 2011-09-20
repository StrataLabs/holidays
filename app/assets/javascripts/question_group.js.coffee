class Strata.QuestionGroup
  constructor: ->
    @questions = []
    @currentIndex = 0

  next: ->
    @questions[@currentIndex].hide()
    @currentIndex++
    @questions[@currentIndex].show()

  add: (question)->
    @questions.push(question)
    question.hide() if @questions.length > 1
    question.events.bind "questionSave", =>
      this.next()
