mediator = require 'mediator'
Controller = require 'controllers/base/controller'
UserTalks = require 'collections/user_talks'

module.exports = class UserTalksController extends Controller
  initialize: ->
    super
    @collection = mediator.userTalks
    @collection.fetch()
    @initEvents()

  initEvents: ->
    @subscribeEvent 'userTalks:add', @addTalk
    @subscribeEvent 'userTalks:remove', @removeTalk

  addTalk: (talk) ->
    @collection.create(id: talk.id, talk: talk)

  removeTalk: (talk) ->
    @collection.where(id: talk.id)[0].destroy()
