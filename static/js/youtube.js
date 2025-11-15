/* ---
 * Privacy-First YouTube Embed Script
 * [Ref: Project Context, 14, 15]
 *
 * This script is safe:
 * 1. No XSS risk: It doesn't parse user input.
 * 2. No Privacy risk: It only runs on-click.
 * 3. Accessible: It's triggered by an accessible <button>.
--- */

function findAndLoadYouTube() {
  // Find all our "fake players" on the page
  const players = document.querySelectorAll('.lite-youtube');

  for (const player of players) {
    // Add a click listener to the play button
    player.addEventListener('click', (event) => {
      // Don't let the click bubble up
      event.preventDefault(); 
      
      const videoId = player.dataset.youtubeId;
      if (!videoId) {
        console.error('YouTube video ID not found.');
        return;
      }

      // Create the real iframe
      const iframe = document.createElement('iframe');
      iframe.setAttribute('src', `https://www.youtube.com/embed/${videoId}?autoplay=1`);
      iframe.setAttribute('frameborder', '0');
      iframe.setAttribute('allow', 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture');
      iframe.setAttribute('allowfullscreen', 'true');
      iframe.setAttribute('title', 'YouTube Video Player'); // Accessibility
      
      // Replace the "fake player" with the real one
      player.innerHTML = ''; // Clear the contents
      player.appendChild(iframe);
      player.classList.add('lite-youtube-loaded'); // Mark as loaded
    }, { once: true }); // Only run this click event once
  }
}

// Run the function once the page is loaded
document.addEventListener('DOMContentLoaded', findAndLoadYouTube);
