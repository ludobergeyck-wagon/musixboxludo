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

      this.audioElementTarget.addEventListener("play", () => {
        this.notifySongStarted()
      })
    }
  }

  notifySongStarted() {
    const event = new CustomEvent("song-started", {
      detail: { duration: this.audioElementTarget.duration }
    })
    window.dispatchEvent(event)
  }

  syncToTime(seconds) {
    if (this.hasAudioElementTarget && seconds > 0) {
      console.log(`Syncing audio to ${seconds} seconds`)
      this.audioElementTarget.currentTime = seconds
      // ✅ CORRECTION : audioElementTarget au lieu de audioElementElement
      this.audioElementTarget.play().catch(err => {
        console.error("Erreur lors de la lecture audio:", err)
        this.showPlayPrompt()
      })
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
      // ✅ Gestion d'erreur pour mobile
      this.audioElementTarget.play().catch(err => {
        console.error("Autoplay bloqué:", err)
        this.showPlayPrompt()
      })
    }
    if (this.hasVisualizerTarget) {
      this.visualizerTarget.classList.remove("paused")
    }
  }

  // ✅ Affiche le prompt existant dans le DOM
  showPlayPrompt() {
    const overlay = document.getElementById('audio-unlock-overlay')
    if (overlay) {
      overlay.classList.remove('d-none')
    }
  }

  // ✅ Cache le prompt et lance le son (appelé par le bouton dans la vue)
  unlockAudio() {
    this.audioElementTarget.play().then(() => {
      const overlay = document.getElementById('audio-unlock-overlay')
      if (overlay) {
        overlay.classList.add('d-none')
      }
    }).catch(err => {
      console.error("Impossible de lancer le son:", err)
      alert("Votre navigateur bloque le son. Vérifiez vos paramètres.")
    })
  }

  disconnect() {
    console.log("audio déconnecté")
    if (this.hasAudioElementTarget) {
      this.audioElementTarget.pause()
      this.audioElementTarget.currentTime = 0
    }
  }
}