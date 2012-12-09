mediator = require 'mediator'
template = require 'views/templates/home'
PageView = require 'views/base/page_view'
TalksView = require 'views/talks_view'
Talks = require 'collections/talks'
UserTalksView = require 'views/user_talks_view'
UserTalks = require 'collections/user_talks'

module.exports = class HomePageView extends PageView
  template: template
  className: 'home-page'

  renderSubviews: ->
    talks = new Talks
    @subview 'talks', new TalksView
      collection: talks,
      container: @$('[data-js="talks"]')
    talks.fetch()

    @subview 'userTalks', new UserTalksView
      collection: mediator.userTalks,
      container: @$('[data-js="user-talks"]')
