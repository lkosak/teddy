Model = require 'models/base/model'

module.exports = class Talk extends Model
  parse: (response) ->
    response.published_on = new Date(response.published_on)
    response
