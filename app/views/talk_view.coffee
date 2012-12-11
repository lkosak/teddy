mediator = require 'mediator'
template = require 'views/templates/talk'
View = require 'views/base/view'

module.exports = class TalkView extends View
  template: template

  initialize: ->
    super
    @delegate 'click', '[rel="add"]', @addTalk
    @delegate 'click', '[rel="remove"]', @removeTalk
    @modelBind 'change', @render

  render: ->
    @model.set 'saved', mediator.userTalks.get(@model.id) != undefined
    super

  addTalk: ->
    @publishEvent 'userTalks:add', @model

  removeTalk: ->
    @publishEvent 'userTalks:remove', @model
