import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["player", "audioElement", "visualizer", "buzzer"]
  static values = { groupId: Number }

  connect() {
    console.log("audio connecté")
  
    if (this.hasAudioElementTarget) {
      this.audioElementTarget.addEventListener("ended", () => {
        console.log("Musique terminée - arrêt des animations")
        if (this.hasVisualizerTarget) {
          this.visualizerTarget.classList.add("paused")
        }
        if (this.hasBuzzerTarget) {
          this.buzzerTarget.classList.add("music-ended")
        }
      })

      // Quand la musique commence à jouer, notifie le serveur
      this.audioElementTarget.addEventListener("play", () => {
        this.notifySongStarted()
      })
    }
  }

  notifySongStarted() {
    // Envoie au serveur que la chanson a démarré
    const event = new CustomEvent("song-started", {
      detail: { duration: this.audioElementTarget.duration }
    })
    window.dispatchEvent(event)
  }

  syncToTime(seconds) {
    if (this.hasAudioElementTarget && seconds > 0) {
      console.log(`Syncing audio to ${seconds} seconds`)
      this.audioElementTarget.currentTime = seconds
      this.audioElementTarget.play()
      if (this.hasVisualizerTarget) {
        this.visualizerTarget.classList.remove("paused")
      }
    }
  }

  pause() {
    console.log("pause() called")
    if (this.audioElementTarget) {
      this.audioElementTarget.pause()
    }
    if (this.hasVisualizerTarget) {
      this.visualizerTarget.classList.add("paused")
    }
  }

  play() {
    console.log("play() called")
    if (this.audioElementTarget) {
      this.audioElementTarget.play()
    }
    if (this.hasVisualizerTarget) {
      this.visualizerTarget.classList.remove("paused")
    }
  }

  disconnect() {
    console.log("audio déconnecté")
    if (this.hasAudioElementTarget) {
      this.audioElementTarget.pause()
      this.audioElementTarget.currentTime = 0
    }
  }
}