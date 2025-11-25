document.addEventListener('DOMContentLoaded', () => {
    const copyButtons = document.querySelectorAll('.copy-code-btn');

    copyButtons.forEach(btn => {
        btn.addEventListener('click', () => {
            const pre = btn.nextElementSibling;
            const code = pre.querySelector('code');
            const text = code.innerText;

            navigator.clipboard.writeText(text).then(() => {
                // Success Feedback
                const originalIcon = btn.innerHTML;
                
                // Temporary Checkmark (We assume check.svg exists or use emoji fallback if needed, 
                // but we will fetch the SVG in step 5)
                btn.innerHTML = '<span role="img" aria-label="Copied">✓</span>'; 
                btn.setAttribute('aria-label', 'Copied!');
                
                setTimeout(() => {
                    btn.innerHTML = originalIcon;
                    btn.setAttribute('aria-label', 'Copy code to clipboard');
                }, 2000);
            }).catch(err => {
                console.error('Failed to copy:', err);
            });
        });
    });
});
