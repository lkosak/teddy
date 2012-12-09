TalkView = require 'views/talk_view'
CollectionView = require 'views/base/collection_view'

module.exports = class TalksView extends CollectionView
  tagname: 'ul'
  className: 'talks-list'
  itemView: TalkView
  autoRender: true
