document.addEventListener('DOMContentLoaded', () => {
    const toggle = document.getElementById('menu-toggle');
    const menu = document.getElementById('main-menu');

    if (!toggle || !menu) return;

    toggle.addEventListener('click', () => {
        // 1. Toggle State
        const isExpanded = toggle.getAttribute('aria-expanded') === 'true';
        toggle.setAttribute('aria-expanded', !isExpanded);
        
        // 2. Toggle Visibility Class
        // We use a class selector for CSS transitions instead of inline styles
        menu.classList.toggle('is-open');

        // 3. Icon Swap (Optional visual polish)
        // We swap the label to help screen readers context
        const label = isExpanded ? "Open Menu" : "Close Menu";
        toggle.setAttribute('aria-label', label);
    });
});
