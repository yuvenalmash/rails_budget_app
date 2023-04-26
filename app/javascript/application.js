// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("DOMContentLoaded", () => {
  // flash messages
  const flashMessagesContainer = document.querySelector("#flash-messages");
  if (flashMessagesContainer) {
    const delay = 5000;
    setTimeout(() => {
      console.log("hiding flash messages");
      flashMessagesContainer.style.display = "none";
      // flashMessagesContainer.classList.add("hidden");
    }, delay);
  }

  const currentUser = JSON.parse(document.querySelector('body').dataset.currentUser);

  if (currentUser) {
    const hamburgerBtn = document.getElementById("hamburger-btn");
    const popup = document.getElementById("popup");
    const closePopupBtn = document.getElementById("close-popup-btn");

    hamburgerBtn.addEventListener("click", () => {
      popup.classList.remove("hidden");
    });

    closePopupBtn.addEventListener("click", () => {
      popup.classList.add("hidden");
    });
  }
});
