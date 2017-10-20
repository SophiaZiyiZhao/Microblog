// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".
import socket from "./socket"

let handlebars = require("handlebars");

$(function() {
  if (!$("#likes-template").length > 0) {
    return;
  }

  let liketmpl = $($("#likes-template")[0]);
  let code = liketmlp.html();
  let tmpl = handlebars.compile(code);

  let messageLike = $($("#message-likes")[0]);
  let path = messageLike.data('path');
  let message_id = messageLike.data('message_id');

  let button = $($("#like-btn")[0]);
  let like_userId = button.data('user_id');

  function fetch_likes() {
    function got_likes(data) {
      console.log(data);
      let html = tmpl(data);
      messageLike.html(html);
    }

    $.ajax({
      url: path,
      data: {message_id: message_id},
      contentType: "application/json",
      dataType: "json",
      method: "GET",
      success: got_likes,
    });
  }

  function add_like() {
    let data = {like: {user_id: like_userId, message_id: message_id}};

    $.ajax({
      url: path,
      data: JSON.stringify(data),
      contentType: "application/json",
      dataType: "json",
      method: "POST",
      success: fetch_likes,
    });
  window.location.reload();
  }

  button.click(add_like);

  fetch_likes();
})
