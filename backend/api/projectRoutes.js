// ============================================
// Project Routes
// ============================================
const router = require('express').Router();
const { getProjects, getFeaturedProjects, getProjectBySlug } = require('../controllers/projectController');

// Order matters: /featured must come before /:slug
router.get('/', getProjects);
router.get('/featured', getFeaturedProjects);
router.get('/:slug', getProjectBySlug);

module.exports = router;
