// ============================================
// Social Links Controller
// ============================================
const { query } = require('../models/db');
const { success } = require('../utils/response');

async function getSocialLinks(req, res, next) {
  try {
    const links = await query(
      'SELECT * FROM social_links WHERE is_active = 1 ORDER BY sort_order ASC'
    );
    return success(res, links, 'Social links fetched');
  } catch (err) {
    next(err);
  }
}

module.exports = { getSocialLinks };
