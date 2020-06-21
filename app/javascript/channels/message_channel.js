import CableReady from 'cable_ready'
import consumer from './consumer'

document.addEventListener('turbolinks:load', () => {
  const room_element = document.getElementById('room-id');
  const room_id = room_element.getAttribute('data-room-id');

  consumer.subscriptions.subscriptions.forEach((subscription) => {
    consumer.subscriptions.remove(subscription)
  })

  consumer.subscriptions.create({ channel: "MessageChannel", id: room_id },{

    connected() {
      console.log("connected to ")
      // Called when the subscription is ready for use on the server
    },

    received (data) {
      if (data.cableReady) CableReady.perform(data.operations)
    }
  })
})