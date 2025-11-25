document.addEventListener('DOMContentLoaded', () => {
    const players = document.querySelectorAll('.youtube-lite');

    players.forEach(player => {
        // Handle Mouse Click
        player.addEventListener('click', (e) => loadVideo(player));

        // Handle Keyboard (Enter/Space)
        player.addEventListener('keydown', (e) => {
            if (e.key === 'Enter' || e.key === ' ') {
                e.preventDefault();
                loadVideo(player);
            }
        });
    });

    function loadVideo(wrapper) {
        if (wrapper.dataset.loaded) return;

        const id = wrapper.dataset.id;
        const title = wrapper.getAttribute('aria-label');
        
        // [Source: 191] Call API only on click
        // Using youtube-nocookie for extra privacy
        const iframe = document.createElement('iframe');
        iframe.setAttribute('src', `https://www.youtube-nocookie.com/embed/${id}?autoplay=1`);
        iframe.setAttribute('title', title);
        iframe.setAttribute('allow', 'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture');
        iframe.setAttribute('allowfullscreen', '');
        
        // Clear thumbnail and play button
        wrapper.innerHTML = '';
        wrapper.appendChild(iframe);
        wrapper.dataset.loaded = 'true';
    }
});
