document.addEventListener('DOMContentLoaded', () => {
    const toggle = document.getElementById('menu-toggle');
    const menu = document.getElementById('main-menu');
    const navContainer = document.getElementById('main-nav');

    if (!toggle || !menu) return;

    // Helper: Close Menu
    function closeMenu() {
        toggle.setAttribute('aria-expanded', 'false');
        toggle.setAttribute('aria-label', 'Open Menu');
        menu.classList.remove('is-open');
        navContainer.classList.remove('has-scrim');
        document.body.style.overflow = ''; // Restore scrolling
    }

    // Helper: Open Menu
    function openMenu() {
        toggle.setAttribute('aria-expanded', 'true');
        toggle.setAttribute('aria-label', 'Close Menu');
        menu.classList.add('is-open');
        navContainer.classList.add('has-scrim');
        document.body.style.overflow = 'hidden'; // Lock scrolling
    }

    // 1. Toggle Click
    toggle.addEventListener('click', (e) => {
        e.stopPropagation(); // Prevent immediate bubbling
        const isExpanded = toggle.getAttribute('aria-expanded') === 'true';
        if (isExpanded) {
            closeMenu();
        } else {
            openMenu();
        }
    });

    // 2. Click Outside (Scrim) to Close
    document.addEventListener('click', (e) => {
        const isExpanded = toggle.getAttribute('aria-expanded') === 'true';
        if (isExpanded && !menu.contains(e.target) && !toggle.contains(e.target)) {
            closeMenu();
        }
    });

    // 3. Escape Key to Close (Accessibility)
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && toggle.getAttribute('aria-expanded') === 'true') {
            closeMenu();
            toggle.focus(); // Return focus to button
        }
    });
});
