import { Controller } from "@hotwired/stimulus"
import consumer from "channels/consumer"

// Connects to data-controller="lobby"
export default class extends Controller {
  static values = {
    groupId: Number,
    userId: Number,
    startUrl: String,
    sessionPath: String
  }

  connect() {
    console.log("connected")
    this.channel = consumer.subscriptions.create(
      {
        channel: "LobbyChannel",
        group_id: this.groupIdValue,
        user_session_id: this.userSessionIdValue,
        user_id: this.userIdValue      },
      {
        received: this.received.bind(this)
      }
    )
  }

  disconnect() {
    if (this.channel) {
      this.channel.unsubscribe()
    }
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



  received(data) {
    console.log("Received:", data)
    console.log("HTML content:", data.html)
    console.log("Players element:", document.getElementById('players'))

    if (data.type === 'user_joined') {
      const playersEl = document.getElementById('players')
      const existingPlayer = document.getElementById(`player_${data.user_id}`)

      if (playersEl && !existingPlayer) {
        playersEl.insertAdjacentHTML('beforeend', data.html)
      }
    }

    if (data.type === 'video_paused') {
      const audioEl = document.querySelector('[data-controller~="audio"]')
      if (audioEl) {
        const audioController = this.application.getControllerForElementAndIdentifier(audioEl, 'audio')
        if (audioController) audioController.pause()
      }
    }

    if (data.type === 'video_playing') {
      const audioEl = document.querySelector('[data-controller~="audio"]')
      if (audioEl) {
        const audioController = this.application.getControllerForElementAndIdentifier(audioEl, 'audio')
        if (audioController) audioController.play()
      }
    }

    if (data.type === "user_left") {
      // console.log(`${data.user_id} left the lobby`)
      const playerElement = document.getElementById(`player_${data.user_id}`)
      if (playerElement) {
        playerElement.remove()
      }
    }

    if (data.type === 'pseudo_updated') {
      // Met à jour le nom du joueur dans le lobby en temps réel
      const playerElement = document.getElementById(`player_${data.user_id}`)
      if (playerElement) {
        const nameElement = playerElement.querySelector('p')
        if (nameElement) {
          nameElement.textContent = data.display_name
        }
      }
    }

  if (data.type === 'buzzer_locked') {
      const buzzer = document.querySelector('[data-toggle-target="buzzer"]')
      const buzzerMessage = document.getElementById('buzzer-message')

      // Arrête la musique pour tout le monde
      const audioEl = document.querySelector('[data-controller~="audio"]')
      if (audioEl) {
        const audioController = this.application.getControllerForElementAndIdentifier(audioEl, 'audio')
        if (audioController) audioController.pause()
      }

      // Arrête le timer pour tout le monde
      const counterEl = document.querySelector('[data-controller~="counter"]')
      if (counterEl) {
        const counterController = this.application.getControllerForElementAndIdentifier(counterEl, 'counter')
        if (counterController) counterController.stopTimer()
      }

      if (data.user_id === this.userIdValue) {
        // I pressed the buzzer - toggle controller handles this
      } else {
        // Someone else pressed - hide my buzzer, show message
        if (buzzer) buzzer.classList.add('d-none')
        if (buzzerMessage) {
          buzzerMessage.textContent = `${data.user_id} is answering...`
          buzzerMessage.classList.remove('d-none')
        }
      }
    }

    if (data.type === 'buzzer_unlocked') {
      const buzzer = document.querySelector('[data-toggle-target="buzzer"]')
      const buzzerMessage = document.getElementById('buzzer-message')

      // Show buzzer for everyone except the user who got it wrong
      if (data.user_id !== this.userIdValue) {
        if (buzzer) buzzer.classList.remove('d-none')
      }
      if (buzzerMessage) buzzerMessage.classList.add('d-none')
    }

    if (data.type === 'round_won') {
      const buzzer = document.querySelector('[data-toggle-target="buzzer"]')
      const buzzerMessage = document.getElementById('buzzer-message')

      if (buzzer) buzzer.classList.add('d-none')
      if (buzzerMessage) {
        buzzerMessage.textContent = `Player ${data.user_id} got it right!`
        buzzerMessage.classList.remove('d-none')
      }
    }

    if (data.type === "start_game") {
      // each client goes to its own play_session_path(@user_session)
      window.location = this.startUrlValue
    }

    if (data.type === 'next_question') {
      window.location = `${this.sessionPathValue}?current_question=${data.question_id}`
    }
  }

  buzzerPressed() {
    this.channel.perform('buzzer_pressed', {
      user_id: this.userIdValue,
    })
  }

  answerWrong() {
    this.channel.perform('answer_wrong', {
      user_id: this.userIdValue
    })
  }

  // Call this when answer is correct
  answerCorrect() {
    this.channel.perform('answer_correct', {
      user_id: this.userIdValue
    })
  }

  goToNext(event) {
    event.preventDefault()
    console.log("href:", event.currentTarget.href)
    const url = new URL(event.currentTarget.href)
    const questionId = url.searchParams.get('current_question')
    console.log("questionId:", questionId)
    this.channel.perform('next_question', { question_id: questionId })
  }

  pauseVideo() {
    this.channel.perform('pause_video', { user_id: this.userIdValue })
  }

  playVideo() {
    this.channel.perform('play_video', { user_id: this.userIdValue })
  }

}
