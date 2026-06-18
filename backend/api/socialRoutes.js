// ============================================
// Social Links Routes
// ============================================
const router = require('express').Router();
const { getSocialLinks } = require('../controllers/socialController');

router.get('/', getSocialLinks);

module.exports = router;
