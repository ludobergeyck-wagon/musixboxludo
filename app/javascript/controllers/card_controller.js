import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["userPhoto", "backgroundImage", "cardResult"]

  connect() {
    this.loadUserPhoto()
  }

  loadUserPhoto() {
    const savedPhoto = localStorage.getItem("userSelfie")

    if (savedPhoto && this.hasUserPhotoTarget) {
      // Selfie pris → affiche le selfie
      this.userPhotoTarget.src = savedPhoto
      this.userPhotoTarget.style.display = "block"
      if (this.hasBackgroundImageTarget) {
        this.backgroundImageTarget.style.opacity = "0"
      }
    } else {
      // Pas de selfie → fond orange derrière le logo
      if (this.hasCardResultTarget) {
        this.cardResultTarget.style.backgroundColor = "#FFA500"
      }
      if (this.hasUserPhotoTarget) {
        this.userPhotoTarget.style.display = "none"
      }
    }
  }
}