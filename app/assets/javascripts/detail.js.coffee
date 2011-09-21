class Strata.Detail
  constructor: (@parent, @save_url) ->
    @parent.find(".submit").click (e) => this.submit()

  submit: ->
    $.post @save_url, detail:
        number_of_people: @parent.find("#detail_number_of_people").val()
        duration: @parent.find("#detail_duration").val()
        time_of_travel: @parent.find("#detail_time_of_travel").val()
        group_type: @parent.find("#detail_group_type").val()
