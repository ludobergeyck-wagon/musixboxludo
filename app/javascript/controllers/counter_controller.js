import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="counter"
export default class extends Controller {
  static targets = ["input", "display"]
  static values = { duration: { type: Number, default: 30 } }  // 30 secondes par défaut

  // Lancement du temps à la connection et initialisation du elapsed
  connect() {
    this.startTime = Date.now()
    this.elapsed = 0
    this.remaining = this.durationValue * 1000  // Convertir en ms
    this.startCountdown()
  }

  // Décompte de 30 secondes
  startCountdown() {
    // Afficher immédiatement
    if (this.hasDisplayTarget) {
      this.displayTarget.textContent = this.formatTime(this.remaining)
    }

    this.timer = setInterval(() => {
      this.elapsed = Date.now() - this.startTime
      this.remaining = Math.max(0, (this.durationValue * 1000) - this.elapsed)

      // Met à jour l'affichage du timer si la target existe
      if (this.hasDisplayTarget) {
        this.displayTarget.textContent = this.formatTime(this.remaining)

        // Ajoute une classe "urgent" quand il reste moins de 10 secondes
        if (this.remaining <= 10000 && this.remaining > 0) {
          this.displayTarget.classList.add("timer-urgent")
        }
      }

      // Arrête le timer quand il atteint 0
     // Arrête le timer quand il atteint 0
    if (this.remaining <= 0) {
      clearInterval(this.timer)
  
    // Émet un événement pour dire que le temps est écoulé
      this.dispatch("timeup", { bubbles: true })
}
    }, 100);  // Update fréquent pour fluidité
  }

  // Vérifie si l'élément existe et si oui remplace la valeur de l'input (le hidden field) par le temps écoulé.
  saveTime() {
    this.elapsed = Date.now() - this.startTime
    if (this.hasInputTarget) {
      this.inputTarget.value = this.elapsed
    }
  }

  // Formatage du temps pour obtenir un résultat de type 1:00
  formatTime(ms) {
    const totalSeconds = Math.floor(ms / 1000)
    const mins = Math.floor(totalSeconds/60)
    const secs = totalSeconds % 60
    return `${mins}:${secs.toString().padStart(2, '0')}`
  }

  // Nettoyage du chrono
  disconnect() {
    clearInterval(this.timer)
  }
}
