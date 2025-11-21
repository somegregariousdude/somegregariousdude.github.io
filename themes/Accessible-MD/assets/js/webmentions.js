/**
 * Webmention.js (Normalized)
 * Fetches mentions for both Slash and No-Slash URL variations.
 */

document.addEventListener('DOMContentLoaded', () => {
  const container = document.getElementById('webmention-list');
  if (!container) return;

  // 1. Determine the Primary Target
  let rawTarget = container.getAttribute('data-target');
  if (!rawTarget) {
    // Fallback to current URL if no data-target is set
    rawTarget = window.location.href.replace('localhost:1313', 'simplygregario.us');
  }

  // 2. Generate Variations (The "Slash Trap" Fix)
  // We strip the slash from the raw target, then create both versions.
  const cleanTarget = rawTarget.replace(/\/$/, ""); 
  const targetNoSlash = cleanTarget;
  const targetSlash = cleanTarget + "/";

  // 3. Build API Query
  // We use the array syntax 'target[]' to ask for both at once.
  const apiUrl = 'https://webmention.io/api/mentions.jf2' + 
                 '?target[]=' + encodeURIComponent(targetNoSlash) + 
                 '&target[]=' + encodeURIComponent(targetSlash) +
                 '&sort-by=published&sort-dir=down'; // Newest first

  console.log("Fetching Webmentions for:", targetNoSlash, "and", targetSlash);

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
        
        // Content
        const contentDiv = document.createElement('div');
        contentDiv.className = 'mention-content p-content';
        const safeText = entry.content ? (entry.content.text || entry.content.html || '').replace(/<[^>]*>?/gm, '') : '';
        // Limit length
        contentDiv.textContent = safeText.length > 280 ? safeText.substring(0, 280) + '...' : safeText;

        // Meta
        const metaDiv = document.createElement('div');
        metaDiv.className = 'mention-meta';
        metaDiv.textContent = entry['wm-property'] === 'like-of' ? 'liked this' : 
                              entry['wm-property'] === 'repost-of' ? 'reposted this' : 'replied';

        li.appendChild(authorDiv);
        li.appendChild(metaDiv);
        li.appendChild(contentDiv);
        list.appendChild(li);
      });

      container.appendChild(list);
    })
    .catch(err => {
      console.error('Error fetching webmentions:', err);
      container.innerHTML = '<p class="error-text">Unable to load mentions.</p>';
    });
});
