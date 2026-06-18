// ============================================
// Education Controller
// ============================================
const { query } = require('../models/db');
const { success } = require('../utils/response');

async function getEducation(req, res, next) {
  try {
    const education = await query(
      'SELECT * FROM education WHERE is_active = 1 ORDER BY sort_order ASC, end_year DESC'
    );
    return success(res, education, 'Education fetched');
  } catch (err) {
    next(err);
  }
}

module.exports = { getEducation };
