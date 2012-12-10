TalkView = require 'views/talk_view'
CollectionView = require 'views/base/collection_view'

module.exports = class TalksView extends CollectionView
  tagname: 'ul'
  className: 'talks-list'
  itemView: TalkView
  autoRender: true

  initialize: ->
    super
    @setupInfiniteScrolling()

  # render: ->
  #   super

  #   listView = new infinity.ListView(@$el)
  #   @$list.append = (el) =>
  #     @listView.append el
  #     console.log('appending')

  setupInfiniteScrolling: ->
    $(window).scroll _.throttle(=>
      toBottom = $('body').height() - ($(window).scrollTop() + $(window).height())
      @collection.fetchNext() if toBottom < 500
    , 300)
