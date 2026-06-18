// ============================================
// Experience Controller
// ============================================
const { query } = require('../models/db');
const { success } = require('../utils/response');

async function getExperience(req, res, next) {
  try {
    const experience = await query(
      'SELECT * FROM experience WHERE is_active = 1 ORDER BY sort_order ASC, start_date DESC'
    );
    return success(res, experience, 'Experience fetched');
  } catch (err) {
    next(err);
  }
}

module.exports = { getExperience };
