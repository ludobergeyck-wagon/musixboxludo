import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="audio"
export default class extends Controller {
  static targets = ["player", "audioElement", "visualizer", "buzzer"]

  connect() {
    console.log("audio connecté")
  
    // Écoute l'événement "ended" pour arrêter le disque et le buzzer quand la musique finit
    if (this.hasAudioElementTarget) {
      this.audioElementTarget.addEventListener("ended", () => {
        console.log("Musique terminée - arrêt des animations")
        // Arrête le vinyl
        if (this.hasVisualizerTarget) {
          this.visualizerTarget.classList.add("paused")
        }
        // Arrête l'animation pulse du buzzer
        if (this.hasBuzzerTarget) {
          this.buzzerTarget.classList.add("music-ended")
        }
      })
    }
  }

  pause() {
    console.log("pause() called")
    if (this.audioElementTarget) {
      this.audioElementTarget.pause()
    }
    // Stoppe l'animation des barres
    if (this.hasVisualizerTarget) {
      this.visualizerTarget.classList.add("paused")
    }
  }

  play() {
    console.log("play() called")
    if (this.audioElementTarget) {
      this.audioElementTarget.play()
    }
    // Relance l'animation des barres
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
