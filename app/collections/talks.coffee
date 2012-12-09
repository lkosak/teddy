config = require 'config'
Collection = require 'models/base/collection'
Talk = require 'models/talk'

module.exports = class Talks extends Collection
  model: Talk
  url: "#{config.api.versionRoot}/talks"
