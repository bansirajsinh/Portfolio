// ============================================
// Home Page — Load featured content from API
// ============================================
document.addEventListener('DOMContentLoaded', () => {
  loadFeaturedProjects();
  loadFeaturedSkills();
});

// ---- Featured Projects ----
async function loadFeaturedProjects() {
  const grid = document.getElementById('featuredProjectsGrid');
  if (!grid) return;

  try {
    const res = await API.get('/projects/featured');
    const projects = res.data;

    if (!projects || projects.length === 0) {
      grid.innerHTML = '<p class="text-secondary text-center">Projects coming soon.</p>';
      return;
    }

    grid.innerHTML = projects.map(p => `
      <div class="card card-glow">
        <h3 class="card-title">${escapeHtml(p.title)}</h3>
        <p class="card-text">${escapeHtml(p.short_description)}</p>
        <div class="badge-group mb-md">
          ${(p.technologies || []).map(t =>
            `<span class="badge">${escapeHtml(t.technology_name)}</span>`
          ).join('')}
        </div>
        <div class="btn-group">
          ${p.github_url ? `<a href="${escapeHtml(p.github_url)}" target="_blank" rel="noopener" class="btn btn-ghost btn-sm">GitHub</a>` : ''}
          ${p.live_url ? `<a href="${escapeHtml(p.live_url)}" target="_blank" rel="noopener" class="btn btn-primary btn-sm">Live</a>` : ''}
          <a href="/projects/${escapeHtml(p.slug)}" class="btn btn-outline btn-sm">Details</a>
        </div>
      </div>
    `).join('');
  } catch (err) {
    grid.innerHTML = '<p class="text-secondary text-center">Unable to load projects.</p>';
  }
}

// ---- Featured Skills Preview ----
async function loadFeaturedSkills() {
  const container = document.getElementById('featuredSkills');
  if (!container) return;

  try {
    const res = await API.get('/skills');
    const categories = res.data;

    if (!categories || categories.length === 0) return;

    container.innerHTML = categories.map(cat => `
      <div class="card card-flat">
        <h4 class="card-title">${escapeHtml(cat.category_name)}</h4>
        <div class="badge-group mt-sm">
          ${cat.skills.map(s =>
            `<span class="badge">${escapeHtml(s.skill_name)}</span>`
          ).join('')}
        </div>
      </div>
    `).join('');
  } catch (err) {
    // Silently fail — skill preview is optional
  }
}

// ---- Escape HTML ----
function escapeHtml(str) {
  if (!str) return '';
  const div = document.createElement('div');
  div.textContent = str;
  return div.innerHTML;
}
