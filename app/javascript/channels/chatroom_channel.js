import consumer from "./consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {  
    let obj = document.querySelector('#message-container')

    let scroll_bottom = document.querySelector('#message-container').scrollHeight
    
    // Called when there's incoming data on the websocket for this channel
    $('#message-container').append(data.mod_message)
    $('#message_message_body').val('');
    obj.scrollTop = scroll_bottom;
  }
});
