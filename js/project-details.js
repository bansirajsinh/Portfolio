// ============================================
// Project Details Page
// ============================================
document.addEventListener('DOMContentLoaded', () => {
  loadProjectDetails();
});

async function loadProjectDetails() {
  const container = document.getElementById('projectDetail');
  if (!container) return;

  // Get slug from URL path: /projects/slug-name
  const pathParts = window.location.pathname.split('/');
  const slug = pathParts[pathParts.length - 1] || new URLSearchParams(window.location.search).get('slug');

  if (!slug) {
    container.innerHTML = '<p class="text-secondary text-center">No project specified.</p>';
    return;
  }

  // Show loading
  container.innerHTML = `
    <div class="skeleton skeleton-title" style="width: 50%; margin: 0 auto var(--space-lg);"></div>
    <div class="skeleton skeleton-text" style="width: 80%; margin: 0 auto var(--space-sm);"></div>
    <div class="skeleton skeleton-text" style="width: 70%; margin: 0 auto var(--space-sm);"></div>
    <div class="skeleton skeleton-card" style="margin-top: var(--space-xl);"></div>
  `;

  try {
    const res = await API.get(`/projects/${slug}`);
    const p = res.data;

    if (!p) {
      container.innerHTML = '<p class="text-secondary text-center">Project not found.</p>';
      return;
    }

    // Update page title
    document.title = `${p.title} — Bansirajsinh Gohil`;

    container.innerHTML = `
      <!-- Header -->
      <div class="text-center mb-xl">
        <span class="badge badge-accent mb-md">${escapeHtml(p.category_name || 'Project')}</span>
        <h1>${escapeHtml(p.title)}</h1>
      </div>



      <!-- Description -->
      ${p.full_description ? `
      <div class="card-flat mb-xl reveal">
        <h3>📝 Overview</h3>
        <p class="mt-md mb-lg" style="max-width:100%;">${escapeHtml(p.full_description).replace(/\\n/g, '<br>')}</p>
        <!-- CTA Buttons -->
        <div class="btn-group">
          ${p.github_url ? `<a href="${escapeHtml(p.github_url)}" target="_blank" rel="noopener" class="btn btn-primary"><i class="fa-brands fa-github"></i> View on GitHub</a>` : ''}
          ${p.live_url ? `<a href="${escapeHtml(p.live_url)}" target="_blank" rel="noopener" class="btn btn-outline"><i class="fa-solid fa-arrow-up-right-from-square"></i> Live Demo</a>` : ''}
        </div>
      </div>
      ` : ''}

      <!-- Problem & Solution -->
      ${(p.problem_statement || p.solution_summary) ? `
      <div class="grid-2 mb-xl reveal">
        ${p.problem_statement ? `
        <div class="card-flat">
          <h4>🔍 Problem Statement</h4>
          <p class="mt-sm" style="max-width:100%;">${escapeHtml(p.problem_statement).replace(/\\n/g, '<br>')}</p>
        </div>` : ''}
        ${p.solution_summary ? `
        <div class="card-flat">
          <h4>💡 Solution</h4>
          <p class="mt-sm" style="max-width:100%;">${escapeHtml(p.solution_summary).replace(/\\n/g, '<br>')}</p>
        </div>` : ''}
      </div>
      ` : ''}

      <!-- Tech Stack -->
      ${p.technologies && p.technologies.length > 0 ? `
      <div class="card-flat mb-xl reveal">
        <h3>🛠️ Technology Stack</h3>
        <div class="badge-group mt-md">
          ${p.technologies.map(t => `<span class="badge">${escapeHtml(t.technology_name)}</span>`).join('')}
        </div>
      </div>
      ` : ''}

      <!-- Screenshots Gallery -->
      ${p.images && p.images.length > 0 ? `
      <div class="mb-xl reveal">
        <h3 class="mb-lg">📸 Screenshots</h3>
        <div class="screenshots-gallery">
          ${p.images.map(img => `
            <div class="screenshot-item">
              <img src="${escapeHtml(img.image_url)}" alt="${escapeHtml(img.alt_text || p.title)}" loading="lazy">
              ${img.caption ? `<p class="text-muted text-center mt-sm" style="font-size:0.85rem;">${escapeHtml(img.caption)}</p>` : ''}
            </div>
          `).join('')}
        </div>
      </div>
      ` : ''}

      <!-- Extra Links -->
      ${p.links && p.links.length > 0 ? `
      <div class="card-flat mb-xl reveal">
        <h3>🔗 Additional Links</h3>
        <div class="btn-group mt-md">
          ${p.links.map(l => `<a href="${escapeHtml(l.link_url)}" target="_blank" rel="noopener" class="btn btn-ghost btn-sm">${escapeHtml(l.link_label)}</a>`).join('')}
        </div>
      </div>
      ` : ''}

      <!-- Back to Projects -->
      <div class="text-center" style="margin-top: var(--space-xl); margin-bottom: var(--space-2xl);">
        <a href="/projects" class="btn btn-outline">← Back to Projects</a>
      </div>
    `;

    // Re-init scroll reveal for dynamic content
    initScrollReveal();

  } catch (err) {
    container.innerHTML = '<p class="text-secondary text-center">Unable to load project details.</p>';
  }
}

function escapeHtml(str) {
  if (!str) return '';
  const div = document.createElement('div');
  div.textContent = str;
  return div.innerHTML;
}

// Re-init scroll reveal from app.js
function initScrollReveal() {
  const reveals = document.querySelectorAll('.reveal:not(.revealed)');
  if (!reveals.length) return;
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('revealed');
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.1 });
  reveals.forEach(el => observer.observe(el));
}
