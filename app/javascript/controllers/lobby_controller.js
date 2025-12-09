import { Controller } from "@hotwired/stimulus"
import consumer from "channels/consumer"

// Connects to data-controller="lobby"
export default class extends Controller {
  static values = {
    groupId: Number,
    userId: Number,
    startUrl: String,
  }

  connect() {
    console.log("connected")
    this.channel = consumer.subscriptions.create(
      {
        channel: "LobbyChannel",
        group_id: this.groupIdValue,
        user_id: this.userIdValue      },
      {
        received: this.received.bind(this)
      }
    )
  }

  start() {
    fetch(`/groups/${this.groupIdValue}/start`, {
      method: "POST",
      headers: {
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content,
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ user_id: this.userIdValue })
    })
  }


  disconnect() {
    if (this.channel) {
      this.channel.unsubscribe()
    }
  }

  received(data) {
    console.log("Received:", data)
    console.log("HTML content:", data.html)
    console.log("Players element:", document.getElementById('players'))

    if (data.type === "user_joined") {
      document.getElementById('players').insertAdjacentHTML('beforeend', data.html)
    }

    if (data.type === "user_left") {
      // console.log(`${data.user_id} left the lobby`)
      const playerElement = document.getElementById(`player_${data.user_id}`)
      if (playerElement) {
        playerElement.remove()
      }
    }

    if (data.type === "start_game") {
      // each client goes to its own play_session_path(@user_session)
      window.location = this.startUrlValue
    }
  }
}
