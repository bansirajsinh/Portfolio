// ============================================
// Contact Routes — with validation + rate limiting
// ============================================
const router = require('express').Router();
const { submitContact } = require('../controllers/contactController');
const { contactValidation, handleValidation } = require('../middleware/validation');
const { contactLimiter } = require('../middleware/rateLimiter');

// POST /api/contact — rate limited, validated, then submitted
router.post('/', contactLimiter, contactValidation, handleValidation, submitContact);

module.exports = router;
