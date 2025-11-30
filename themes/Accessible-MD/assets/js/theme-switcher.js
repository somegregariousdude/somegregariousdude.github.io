document.addEventListener('DOMContentLoaded', () => {
  const themeButtons = document.querySelectorAll('.theme-btn');
  if (!themeButtons.length) return;

  // 1. Initialize ARIA state based on current active theme
  // We check the HTML tag, default to 'sound' if missing.
  const currentTheme = document.documentElement.getAttribute('data-theme') || 'sound';
  
  themeButtons.forEach(btn => {
    if (btn.dataset.value === currentTheme) {
      btn.setAttribute('aria-pressed', 'true');
    } else {
      btn.setAttribute('aria-pressed', 'false');
    }

    // 2. Add Click Listeners
    btn.addEventListener('click', (e) => {
      const selectedTheme = e.currentTarget.dataset.value;
      const validThemes = ['sound', 'market', 'mountain', 'forest', 'sunset'];

      // Security: Whitelist check
      if (!validThemes.includes(selectedTheme)) return;

      // Apply Logic
      document.documentElement.setAttribute('data-theme', selectedTheme);
      localStorage.setItem('greg_theme', selectedTheme);

      // Update UI State
      themeButtons.forEach(b => b.setAttribute('aria-pressed', 'false'));
      e.currentTarget.setAttribute('aria-pressed', 'true');
    });
  });
});
