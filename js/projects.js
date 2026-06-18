// ============================================
// Projects Page — Load, Filter, Render
// ============================================
document.addEventListener('DOMContentLoaded', () => {
  loadProjects();
  initFilters();
});

let allProjects = [];

async function loadProjects() {
  const grid = document.getElementById('projectsGrid');
  if (!grid) return;

  // Show skeleton loading
  grid.innerHTML = Array(6).fill(0).map(() =>
    '<div class="card skeleton skeleton-card"></div>'
  ).join('');

  try {
    const res = await API.get('/projects');
    allProjects = res.data || [];
    renderProjects(allProjects);
  } catch (err) {
    grid.innerHTML = '<p class="text-secondary text-center">Unable to load projects.</p>';
  }
}

function renderProjects(projects) {
  const grid = document.getElementById('projectsGrid');
  if (!grid) return;

  if (projects.length === 0) {
    grid.innerHTML = '<p class="text-secondary text-center">No projects found in this category.</p>';
    return;
  }

  grid.innerHTML = projects.map(p => `
    <div class="card card-glow" data-category="${escapeHtml(p.category_slug || '')}">
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
        <a href="/projects/${escapeHtml(p.slug)}" class="btn btn-outline btn-sm">Details →</a>
      </div>
    </div>
  `).join('');
}

function initFilters() {
  const buttons = document.querySelectorAll('.filter-btn');
  if (!buttons.length) return;

  buttons.forEach(btn => {
    btn.addEventListener('click', () => {
      // Update active state
      buttons.forEach(b => b.classList.remove('active'));
      btn.classList.add('active');

      const filter = btn.dataset.filter;

      if (filter === 'all') {
        renderProjects(allProjects);
      } else {
        const filtered = allProjects.filter(p => p.category_slug === filter);
        renderProjects(filtered);
      }
    });
  });
}

function escapeHtml(str) {
  if (!str) return '';
  const div = document.createElement('div');
  div.textContent = str;
  return div.innerHTML;
}
