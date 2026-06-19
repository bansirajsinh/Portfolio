// ============================================
// Home Page — Typing Animation, Stats Counter, Featured Content
// ============================================
document.addEventListener('DOMContentLoaded', () => {
  loadFeaturedProjects();
  loadFeaturedSkills();
  initTypingAnimation();
  initStatsCounter();
});

// ---- Typing Animation ----
function initTypingAnimation() {
  const el = document.getElementById('typedText');
  if (!el) return;

  const phrases = [
    'Flutter mobile apps',
    'full-stack web apps',
    'blockchain solutions',
    'Firebase integrations',
    'responsive interfaces',
    'REST APIs'
  ];

  let phraseIdx = 0;
  let charIdx = 0;
  let isDeleting = false;
  let speed = 80;

  function type() {
    const currentPhrase = phrases[phraseIdx];

    if (isDeleting) {
      el.textContent = currentPhrase.substring(0, charIdx - 1);
      charIdx--;
      speed = 40;
    } else {
      el.textContent = currentPhrase.substring(0, charIdx + 1);
      charIdx++;
      speed = 80;
    }

    if (!isDeleting && charIdx === currentPhrase.length) {
      speed = 2000; // Pause at end
      isDeleting = true;
    } else if (isDeleting && charIdx === 0) {
      isDeleting = false;
      phraseIdx = (phraseIdx + 1) % phrases.length;
      speed = 400; // Short pause before next phrase
    }

    setTimeout(type, speed);
  }

  // Start after hero animation finishes
  setTimeout(type, 1200);
}

// ---- Stats Counter Animation ----
function initStatsCounter() {
  const counters = document.querySelectorAll('.stat-number[data-target]');
  if (counters.length === 0) return;

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const el = entry.target;
        const target = parseInt(el.dataset.target);
        animateCounter(el, target);
        observer.unobserve(el);
      }
    });
  }, { threshold: 0.5 });

  counters.forEach(counter => observer.observe(counter));
}

function animateCounter(el, target) {
  let current = 0;
  const duration = 1500;
  const increment = target / (duration / 30);
  const suffix = '+';

  function update() {
    current += increment;
    if (current >= target) {
      el.textContent = target + suffix;
      return;
    }
    el.textContent = Math.floor(current) + suffix;
    requestAnimationFrame(update);
  }
  requestAnimationFrame(update);
}

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
