/**
 * Webmention Logic
 * Context: Source [214] Minimal, purposeful JS.
 * Refactored: Phase 02j (Robustness Patch)
 */

(function() {
    const container = document.getElementById('webmentions');
    if (!container) return;

    const target = container.dataset.target;
    const list = document.getElementById('webmentions-list');
    const itemsPerPage = 20;
    let currentPage = 1;
    let allMentions = [];

    const apiUrl = 'https://webmention.io/api/mentions.jf2?target=' + encodeURIComponent(target);

    fetch(apiUrl)
        .then(response => {
            if (!response.ok) throw new Error('Network response was not ok');
            return response.json();
        })
        .then(data => {
            // [Patch] Filter out completely empty/malformed items
            allMentions = (data.children || []).filter(item => {
                const hasContent = item.content && (item.content.text || item.content.html);
                const hasAuthor = item.author && item.author.name;
                return hasContent || hasAuthor;
            });
            
            if (allMentions.length === 0) {
                list.innerHTML = '<p>No mentions yet. Be the first!</p>';
                return;
            }

            renderPage(1);
        })
        .catch(error => {
            list.innerHTML = '<p class="error">Unable to load conversation at this time.</p>';
            console.error('Webmention Fetch Error:', error);
        });

    function renderPage(page) {
        list.innerHTML = '';
        
        const start = (page - 1) * itemsPerPage;
        const end = start + itemsPerPage;
        const pageItems = allMentions.slice(start, end);

        pageItems.forEach(item => {
            const article = document.createElement('article');
            article.className = 'mention h-cite outlined-card';
            article.innerHTML = buildMentionHTML(item);
            list.appendChild(article);
        });

        if (allMentions.length > itemsPerPage) {
            renderPaginationControls(page);
        }
    }

    function renderPaginationControls(page) {
        const totalPages = Math.ceil(allMentions.length / itemsPerPage);
        const nav = document.createElement('nav');
        nav.className = 'pagination-controls';
        nav.ariaLabel = "Webmention Pagination";

        if (page > 1) {
            const prev = document.createElement('button');
            prev.innerText = 'Previous';
            prev.className = 'button-secondary';
            prev.onclick = () => { 
                currentPage--; 
                renderPage(currentPage);
                list.focus(); 
            };
            nav.appendChild(prev);
        }

        if (page < totalPages) {
            const next = document.createElement('button');
            next.innerText = 'Next';
            next.className = 'button-secondary';
            next.onclick = () => { 
                currentPage++; 
                renderPage(currentPage);
                list.focus();
            };
            nav.appendChild(next);
        }
        
        list.appendChild(nav);
    }

    function buildMentionHTML(item) {
        const author = item.author || {};
        const name = author.name || 'Anonymous';
        // [Patch] Handle missing URLs to prevent broken/internal links
        const authorLink = author.url 
            ? `<a href="${author.url}" class="p-name u-url" rel="nofollow">${name}</a>`
            : `<span class="p-name">${name}</span>`;
            
        const content = sanitize(item.content ? item.content.html || item.content.text : '');
        
        // [Patch] Handle missing dates
        let timeHtml = '';
        if (item.published) {
            const dateStr = new Date(item.published).toLocaleDateString();
            if (dateStr !== 'Invalid Date') {
                timeHtml = `<time class="dt-published">${dateStr}</time>`;
            }
        }
        
        return `
            <div class="mention-author u-author h-card">
                <img src="${author.photo || '/images/default-avatar.png'}" alt="" class="u-photo">
                ${authorLink}
            </div>
            <div class="mention-content p-content">
                ${content}
            </div>
            ${timeHtml}
        `;
    }

    function sanitize(html) {
        const parser = new DOMParser();
        const doc = parser.parseFromString(html, 'text/html');
        
        const forbidden = ['script', 'iframe', 'object', 'style', 'link', 'meta'];
        forbidden.forEach(tag => {
            const elements = doc.querySelectorAll(tag);
            elements.forEach(el => el.remove());
        });

        const allElements = doc.querySelectorAll('*');
        allElements.forEach(el => {
            Array.from(el.attributes).forEach(attr => {
                if (attr.name.startsWith('on') || 
                   (attr.name === 'href' && attr.value.toLowerCase().startsWith('javascript:'))) {
                    el.removeAttribute(attr.name);
                }
            });
        });

        return doc.body.innerHTML;
    }
})();
