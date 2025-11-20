// init-search.js
// Initializes Pagefind UI if the container exists.
// Compliance: Client-side search [115]

window.addEventListener('DOMContentLoaded', (event) => {
  const searchDiv = document.getElementById('search');
  if (searchDiv) {
    // PagefindUI is loaded from the /pagefind/ directory generated at build time
    new PagefindUI({ 
      element: "#search", 
      showSubResults: true, 
      showImages: false,
      excerptLength: 25
    });
    
    // Accessibility adjustment: Ensure the input has a label
    // Pagefind generates an input, we can enhance it here if needed in Phase 2
  }
});
