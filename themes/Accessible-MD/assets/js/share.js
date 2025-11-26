document.addEventListener('DOMContentLoaded', () => {
    const dialog = document.getElementById('fedi-share-dialog');
    const fediBtns = document.querySelectorAll('.fediverse-btn');
    const goBtn = document.getElementById('fedi-go-btn');
    const input = document.getElementById('fedi-domain');
    
    let activeHandle = ''; // Store the handle of the network clicked

    if (!dialog) return;

    let currentTitle = document.title;
    let currentUrl = window.location.href;

    // 1. Open Modal & Capture Handle
    fediBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            // Read the handle specific to this button (Friendica vs Mastodon)
            activeHandle = btn.dataset.handle || '';
            
            dialog.showModal();
            input.focus();
        });
    });

    // 2. Handle "Go"
    goBtn.addEventListener('click', () => {
        const domain = input.value.trim();
        if (!domain) return;

        // Construct Text: "Title URL via @handle"
        let text = `${currentTitle} ${currentUrl}`;
        if (activeHandle) {
            text += ` via ${activeHandle}`;
        }

        // Generic Fediverse Share URL Pattern
        const shareUrl = `https://${domain}/share?text=${encodeURIComponent(text)}`;
        
        window.open(shareUrl, '_blank', 'noopener,noreferrer');
        dialog.close();
    });
});
