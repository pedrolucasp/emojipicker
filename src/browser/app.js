// Simple glue to all components
// TODO: Better (and faster) indexing

window.$ = window.jQuery = require("jquery");
require('coffee-script').register();
emojiPicker = require("../app/emojipicker");
clipboard   = require("clipboard");

// Here begins the fun
console.debug(this.EmojiPicker);

var EmojiPicker = new emojiPicker();

// Indexing emojis
setTimeout(EmojiPicker.buildIndex(), 0);

$(".search").on("keyup", function() {
  var query = $(this).val();
  var list = EmojiPicker.search(query);
  $(".emojis").html(list.map(function(emoji){
    return emoji.image;
  }).join(" "));
});

// Dead simple copying the selected emoji
// 👽
$(document).on("click", '.emoji', {}, function(){
  clipboard.writeText($(this).attr("alt"));
});
