EmojiConverter = require "./emoji-converter"
Emoji          = require "./emoji"

module.exports = class EmojiPicker
  constructor: ->
    @list = []
    @emojis = require "emojilib"
    @emojiConverter = new EmojiConverter()

  search: (query) ->
    results = []
    filtered = @list.filter (emoji) -> emoji.name.match query
    filtered.forEach (result) =>
      results.push result if result isnt null

    results

  buildIndex: ->
    refs = Object.keys(@emojis)
    refs.forEach (ref) =>
      temp = @emojis[ref]
      image = @emojiConverter.fromUnicode(temp.char)
      emoji = new Emoji name: ref, char: temp.char, image: image
      @list.push emoji
