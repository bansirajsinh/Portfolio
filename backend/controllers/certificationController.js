// ============================================
// Certification Controller
// ============================================
const { query } = require('../models/db');
const { success } = require('../utils/response');

async function getCertifications(req, res, next) {
  try {
    const certs = await query(
      'SELECT * FROM certifications WHERE is_active = 1 ORDER BY sort_order ASC, issue_date DESC'
    );
    return success(res, certs, 'Certifications fetched');
  } catch (err) {
    next(err);
  }
}

module.exports = { getCertifications };
