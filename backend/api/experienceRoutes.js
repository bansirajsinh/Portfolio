// ============================================
// Experience Routes
// ============================================
const router = require('express').Router();
const { getExperience } = require('../controllers/experienceController');

router.get('/', getExperience);

module.exports = router;
