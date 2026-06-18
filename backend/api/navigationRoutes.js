// ============================================
// Navigation Routes
// ============================================
const router = require('express').Router();
const { getNavigation } = require('../controllers/navigationController');

router.get('/', getNavigation);

module.exports = router;
