console.log("share_card.js loaded");

window.shareResults = function () {
  // 1. Sélectionne la card à capturer
  const cardElement = document.querySelector(".card-result");

  // 2. Capture la card en image avec html2canvas
  html2canvas(cardElement, { scale: 2, backgroundColor: "#FFA500" })
    .then((canvas) => {
      
      // 3. Convertit le canvas en "blob" (fichier binaire)
      canvas.toBlob((blob) => {
        
        // 4. Crée un fichier PNG à partir du blob
        const file = new File([blob], `musixbox_${Date.now()}.png`, { type: "image/png" });

        // 5. Vérifie si le navigateur peut partager des fichiers
        if (navigator.share && navigator.canShare({ files: [file] })) {
          
          // 6. Partage L'IMAGE (pas l'URL !)
          navigator.share({
            title: "Mes résultats MusixBox",
            text: "J'ai terminé ma session sur MusixBox ! 🎵",
            files: [file],  // ✅ Partage le FICHIER IMAGE
          })
        }
      }, "image/png");
    })
}

// Sauvegarde de la card en image
window.savePhoto = function () {
  const cardElement = document.querySelector(".card-result");

  if (!cardElement) {
    alert("Pas de card à sauvegarder");
    return;
  }

  if (typeof html2canvas === "undefined") {
    console.error("html2canvas n'est pas chargé");
    alert("Erreur: html2canvas n'est pas chargé");
    return;
  }

  html2canvas(cardElement, {
    scale: 2,
    backgroundColor: "#0f0f0f", // ou la couleur de fond de ta page
  })
    .then((canvas) => {
      const imageData = canvas.toDataURL("image/png");
      const link = document.createElement("a");
      link.href = imageData;
      link.download = `musixbox_${Date.now()}.png`;
      document.body.appendChild(link);
      link.onclick = () => {
        document.body.removeChild(link);
      };
      link.click();
    })
    .catch((error) => {
      console.error("Erreur de capture:", error);
      alert("Erreur lors de la sauvegarde");
    });
};
