import consumer from "./consumer"
    

consumer.subscriptions.create("ChatroomChannel", {
 
  connected() {
    scroll_bottom()
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {  
    // Called when there's incoming data on the websocket for this channel
    $('#message-container').append(data.mod_message)
    $('#message_message_body').val('');
    scroll_bottom()
  }
});


let scroll_bottom = () =>  {
  let obj = document.querySelector('#message-container')

  let scroll_bottom = document.querySelector('#message-container').scrollHeight
      
  obj.scrollTop = scroll_bottom;

}