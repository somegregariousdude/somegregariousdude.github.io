/**
 * Webmention.js
 * Fetches and renders mentions from webmention.io
 * Logic: Uses 'data-target' attribute if present to determine query URL.
 */

document.addEventListener('DOMContentLoaded', () => {
  const container = document.getElementById('webmention-list');
  if (!container) return;

  // Routing Logic:
  // 1. Check for explicit data-target (used by Guestbook to fetch Root URL mentions)
  // 2. Fallback to current window location (used by standard posts)
  let targetUrl = container.getAttribute('data-target');
  
  if (!targetUrl) {
    targetUrl = window.location.href.replace('localhost:1313', 'simplygregario.us');
  }

  const apiUrl = 'https://webmention.io/api/mentions.jf2?target=' + encodeURIComponent(targetUrl);

  fetch(apiUrl)
    .then(response => response.json())
    .then(data => {
      const children = data.children || [];
      
      if (children.length === 0) {
        container.innerHTML = '<p class="no-mentions">No webmentions yet. Be the first!</p>';
        return;
      }

      container.innerHTML = '';
      const list = document.createElement('ul');
      list.className = 'mention-list';

      children.forEach(entry => {
        const li = document.createElement('li');
        li.className = 'mention-item h-cite';
        
        // Author
        const authorDiv = document.createElement('div');
        authorDiv.className = 'mention-author u-author h-card';
        
        if (entry.author && entry.author.photo) {
          const img = document.createElement('img');
          img.src = entry.author.photo;
          img.alt = entry.author.name || 'Unknown';
          img.className = 'u-photo';
          img.loading = 'lazy';
          authorDiv.appendChild(img);
        }
        
        const authorName = entry.author ? entry.author.name : 'Unknown Author';
        if (entry.author && entry.author.url) {
          const a = document.createElement('a');
          a.href = entry.author.url;
          a.target = '_blank';
          a.rel = 'noopener noreferrer';
          a.className = 'u-url p-name';
          a.textContent = authorName;
          authorDiv.appendChild(a);
        } else {
          const span = document.createElement('span');
          span.className = 'p-name';
          span.textContent = authorName;
          authorDiv.appendChild(span);
        }
        
        // Content (Strict Sanitization)
        const contentDiv = document.createElement('div');
        contentDiv.className = 'mention-content p-content';
        const safeText = entry.content ? (entry.content.text || entry.content.html || '').replace(/<[^>]*>?/gm, '') : '';
        const maxLength = 280;
        contentDiv.textContent = safeText.length > maxLength ? safeText.substring(0, maxLength) + '...' : safeText;

        // Interaction Type
        const metaDiv = document.createElement('div');
        metaDiv.className = 'mention-meta';
        const typeLabel = entry['wm-property'] === 'like-of' ? 'liked this' : 
                          entry['wm-property'] === 'repost-of' ? 'reposted this' : 'replied';
        metaDiv.textContent = typeLabel;

        li.appendChild(authorDiv);
        li.appendChild(metaDiv);
        li.appendChild(contentDiv);
        list.appendChild(li);
      });

      container.appendChild(list);
    })
    .catch(err => {
      console.error('Error fetching webmentions:', err);
      container.innerHTML = '<p class="error-text">Unable to load mentions at this time.</p>';
    });
});
