import consumer from "./consumer"

consumer.subscriptions.create("AppearanceChannel", {
  
  initialized() {
    this.update = this.update.bind(this)
  },

  connected() {
    this.install()
    this.update()
  },

  disconnected() {
  },

  update() {
    this.documentIsActive ? this.appear() : this.away()
  },

  install() {
    window.addEventListener("focus", this.update)
    window.addEventListener("blur", this.update)
    document.addEventListener("turbolinks:load", this.update)
    document.addEventListener("visibilitychange", this.update)
  },
 
  uninstall() {
    window.removeEventListener("focus", this.update)
    window.removeEventListener("blur", this.update)
    document.removeEventListener("turbolinks:load", this.update)
    document.removeEventListener("visibilitychange", this.update)
  },

  received(data) {
    let elements = document.getElementsByClassName(`user-${data.user_id}-status`);
    for (var i = 0; i < elements.length; i++) {
      if(data.status == "Away"){
        elements[i].classList.remove("offline")
        elements[i].classList.remove("online")
        elements[i].classList.add("away")
      }else if(data.status == "Offline"){
        elements[i].classList.remove("online")
        elements[i].classList.remove("away")
        elements[i].classList.add("offline")
      }else if(data.status == "Online"){
        elements[i].classList.remove("offline")
        elements[i].classList.remove("away")
        elements[i].classList.add("online")
      }
    }

  },

  get documentIsActive() {
    return document.visibilityState == "visible" && document.hasFocus()
  },

  appear() {
    this.perform("appear")
  },

  away() {
    this.perform("away")
  },

});
