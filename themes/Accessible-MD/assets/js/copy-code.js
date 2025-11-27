document.addEventListener('DOMContentLoaded', () => {
    // Select both code block buttons and generic copy buttons
    const copyButtons = document.querySelectorAll('.copy-code-btn, .copy-btn');
    const toast = document.getElementById('global-toast');
    let toastTimeout;

    function showToast(message) {
        if (!toast) return;
        toast.textContent = message;
        toast.classList.add('show');
        clearTimeout(toastTimeout);
        toastTimeout = setTimeout(() => {
            toast.classList.remove('show');
        }, 4000);
    }

    copyButtons.forEach(btn => {
        btn.addEventListener('click', () => {
            let textToCopy = '';

            // Strategy 1: Data Attribute (Direct Copy)
            if (btn.hasAttribute('data-clipboard-text')) {
                textToCopy = btn.getAttribute('data-clipboard-text');
            } 
            // Strategy 2: Sibling Code Block (Legacy Support)
            else {
                const pre = btn.nextElementSibling;
                if (pre && pre.querySelector('code')) {
                    textToCopy = pre.querySelector('code').innerText;
                }
            }

            if (!textToCopy) return;

            navigator.clipboard.writeText(textToCopy).then(() => {
                // Visual Feedback
                const originalIcon = btn.innerHTML;
                btn.innerHTML = '<span role="img" aria-label="Copied">✓</span>'; 
                btn.setAttribute('aria-label', 'Copied!');
                
                showToast("Copied to clipboard");
                
                setTimeout(() => {
                    btn.innerHTML = originalIcon;
                    // Restore label based on type
                    const label = btn.classList.contains('copy-code-btn') ? 'Copy code' : 'Copy link';
                    btn.setAttribute('aria-label', label);
                }, 2000);
            }).catch(err => {
                console.error('Failed to copy:', err);
                showToast("Failed to copy");
            });
        });
    });
});
