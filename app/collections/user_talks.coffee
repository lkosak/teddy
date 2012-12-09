Collection = require 'models/base/collection'
Talk = require 'models/talk'

module.exports = class UserTalks extends Collection
  model: Talk
  localStorage: new Backbone.LocalStorage("UserTalks")
