CollectionView = require 'views/base/collection_view'
UserTalkView = require 'views/user_talk_view'

module.exports = class UserTalksView extends CollectionView
  tagname: 'ul'
  className: 'user-talks-list'
  itemView: UserTalkView
  autoRender: true
