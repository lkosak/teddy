template = require 'views/templates/talk'
View = require 'views/base/view'

module.exports = class TalkView extends View
  template: template

  initialize: ->
    super
    @delegate 'click', '[rel="add"]', @addTalk

  addTalk: ->
    @publishEvent 'userTalks:add', @model
