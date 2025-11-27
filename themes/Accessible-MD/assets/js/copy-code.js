document.addEventListener('DOMContentLoaded', () => {
    const copyButtons = document.querySelectorAll('.copy-code-btn');
    const toast = document.getElementById('global-toast');
    let toastTimeout;

    // Helper: Show Toast
    function showToast(message) {
        if (!toast) return;

        // 1. Set Content (Triggers Screen Reader announcement via aria-live)
        toast.textContent = message;

        // 2. Show Visuals
        toast.classList.add('show');

        // 3. Reset Timer
        clearTimeout(toastTimeout);
        toastTimeout = setTimeout(() => {
            toast.classList.remove('show');
        }, 4000); // 4 seconds read time
    }

    copyButtons.forEach(btn => {
        btn.addEventListener('click', () => {
            const pre = btn.nextElementSibling;
            const code = pre.querySelector('code');
            const text = code.innerText;

            navigator.clipboard.writeText(text).then(() => {
                // Visual Feedback on Button (Checkmark)
                const originalIcon = btn.innerHTML;
                btn.innerHTML = '<span role="img" aria-label="Copied">✓</span>'; 
                btn.setAttribute('aria-label', 'Copied!');
                
                // Trigger Toast
                showToast("Copied to clipboard");
                
                // Revert Button after 2s
                setTimeout(() => {
                    btn.innerHTML = originalIcon;
                    btn.setAttribute('aria-label', 'Copy code to clipboard');
                }, 2000);
            }).catch(err => {
                console.error('Failed to copy:', err);
                showToast("Failed to copy code");
            });
        });
    });
});
