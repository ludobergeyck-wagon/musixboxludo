import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["player", "audioElement", "visualizer", "buzzer"]
  static values = {
    groupId: Number,
    unlocked: { type: Boolean, default: false }
  }

  connect() {
    console.log("audio connecté")
 // Unlock au premier tap (seulement si on a l'audio = on est l'hôte)
  if (this.hasAudioElementTarget) {
    const unlockOnInteraction = () => {
      this.unlockAudio()
    }
    
    document.addEventListener("touchstart", unlockOnInteraction, { once: true })
    document.addEventListener("click", unlockOnInteraction, { once: true })
  }

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

  /* ===============================
   * iOS UNLOCK (OBLIGATOIRE)
   * =============================== */
  unlockAudio() {
    if (!this.hasAudioElementTarget || this.unlockedValue) return

    const audio = this.audioElementTarget
    audio.muted = true

    audio.play().then(() => {
      audio.pause()
      audio.currentTime = 0
      audio.muted = false
      this.unlockedValue = true
      console.log("Audio unlocked (iOS OK)")
    }).catch(error => {
      console.error("Audio unlock failed", error)
    })
  }

  /* ===============================
   * SERVER SYNC
   * =============================== */
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
    this.audioElementTarget.play().catch(e => {
      console.error("Play blocked", e)
    })

    if (this.hasVisualizerTarget) {
      this.visualizerTarget.classList.remove("paused")
    }
  }
}

  /* ===============================
   * CONTROLS
   * =============================== */
  pause() {
    console.log("pause() called")

    if (this.hasAudioElementTarget) {
      this.audioElementTarget.pause()
    }

    if (this.hasVisualizerTarget) {
      this.visualizerTarget.classList.add("paused")
    }
  }
play() {
  console.log("play() called")

  // iOS ne permet pas de play() si l'audio n'est pas unlocké par un clic utilisateur
  if (!this.unlockedValue) {
    console.log("Audio not unlocked – play blocked")
    return
  }

  if (this.hasAudioElementTarget) {
    this.audioElementTarget.play().catch(e => {
      console.error("Play blocked", e)
    })
  }

  // Gestion du visualizer si présent
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