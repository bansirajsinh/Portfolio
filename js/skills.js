// ============================================
// Skills Page — Load from API
// ============================================
document.addEventListener('DOMContentLoaded', () => {
  loadSkills();
});

async function loadSkills() {
  const grid = document.getElementById('skillsGrid');
  if (!grid) return;

  // Skeleton
  grid.innerHTML = Array(5).fill(0).map(() =>
    '<div class="card skeleton skeleton-card"></div>'
  ).join('');

  try {
    const res = await API.get('/skills');
    const categories = res.data;

    if (!categories || categories.length === 0) {
      grid.innerHTML = '<p class="text-secondary text-center">No skills found.</p>';
      return;
    }

    grid.innerHTML = categories.map(cat => `
      <div class="card card-glow">
        <h3 class="card-title">${escapeHtml(cat.category_name)}</h3>
        ${cat.description ? `<p class="text-secondary" style="font-size:0.85rem; margin-bottom: var(--space-md);">${escapeHtml(cat.description)}</p>` : ''}
        <div class="badge-group">
          ${cat.skills.map(s =>
            `<span class="badge badge-pop">${escapeHtml(s.skill_name)}</span>`
          ).join('')}
        </div>
      </div>
    `).join('');
  } catch (err) {
    grid.innerHTML = '<p class="text-secondary text-center">Unable to load skills.</p>';
  }
}

function escapeHtml(str) {
  if (!str) return '';
  const div = document.createElement('div');
  div.textContent = str;
  return div.innerHTML;
}
