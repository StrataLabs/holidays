class Strata.FormPersister
  constructor: (@form) ->

  buildForm: (json) ->
    @form.append(this.createSelectBox("neutral", json.preferences.neutral))
    @form.append(this.createSelectBox("likes", json.preferences.likes))
    @form.append(this.createSelectBox("dislikes", json.preferences.dislikes))

  createSelectBox: (name, options) ->
    selectBox = $("<select name='preferences[#{name}][]' multiple></select>")
    for option in options
      selectBox.append($("<option selected='selected' value='#{option}'>#{option}</option>"))
    selectBox

  submit: (json) ->
    this.buildForm(json)
    @form.submit()

class Strata.AsyncPersister
  constructor: (@resourceUrl) ->

  submit: (json, success = ->) ->
    $.post(@resourceUrl, $.extend(json, { _method: "put" }), success)
