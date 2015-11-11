module.exports = class EmojiConverter

  constructor: ->
    @converter = require 'twemoji'

  fromUnicode: (unicode) ->
    @converter.parse " #{unicode} "
