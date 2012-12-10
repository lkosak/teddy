config = require 'config'
Collection = require 'models/base/collection'
Talk = require 'models/talk'

module.exports = class Talks extends Collection
  model: Talk
  baseUrl: "#{config.api.versionRoot}/talks"
  offset: 0
  limit: 30

  url: ->
    "#{@baseUrl}?offset=#{@offset}&limit=#{@limit}"

  fetchNext: (options) ->
    options ?= {}

    unless @fetching
      @fetching = true

      options = _.extend {}, options, {
        add: true
        success: => setTimeout((=> @fetching = false), 1000)
      }

      @fetch(options)

  add: (models, options) ->
    super(models, options)
    @offset += models.length
    @full = true if models.length < @limit
