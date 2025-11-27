document.addEventListener('DOMContentLoaded', () => {
    const toggle = document.getElementById('menu-toggle');
    const menu = document.getElementById('main-menu');
    const navContainer = document.getElementById('main-nav');
    
    // Targets to hide from VoiceOver when menu is open
    const mainContent = document.getElementById('main-content');
    const footer = document.querySelector('.site-footer');

    if (!toggle || !menu) return;

    // Helper: Close Menu
    function closeMenu() {
        toggle.setAttribute('aria-expanded', 'false');
        toggle.setAttribute('aria-label', 'Open Menu');
        menu.classList.remove('is-open');
        navContainer.classList.remove('has-scrim');
        
        // Restore scrolling and accessibility
        document.body.style.overflow = ''; 
        if (mainContent) mainContent.removeAttribute('inert');
        if (footer) footer.removeAttribute('inert');
    }

    // Helper: Open Menu
    function openMenu() {
        toggle.setAttribute('aria-expanded', 'true');
        toggle.setAttribute('aria-label', 'Close Menu');
        menu.classList.add('is-open');
        navContainer.classList.add('has-scrim');
        
        // Lock scrolling and hide background content from VoiceOver
        document.body.style.overflow = 'hidden';
        if (mainContent) mainContent.setAttribute('inert', '');
        if (footer) footer.setAttribute('inert', '');
    }

    // 1. Toggle Click
    toggle.addEventListener('click', (e) => {
        e.stopPropagation();
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

    // 3. Escape Key to Close
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && toggle.getAttribute('aria-expanded') === 'true') {
            closeMenu();
            toggle.focus();
        }
    });
});
