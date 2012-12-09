template = require 'views/templates/user_talk'
View = require 'views/base/view'

module.exports = class UserTalkView extends View
  template: template

  initialize: ->
    super
    @delegate 'click', '[rel="remove"]', @removeTalk

  removeTalk: ->
    @publishEvent 'userTalks:remove', @model
