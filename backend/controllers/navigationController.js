// ============================================
// Navigation Controller
// ============================================
const { query } = require('../models/db');
const { success } = require('../utils/response');

async function getNavigation(req, res, next) {
  try {
    const items = await query(
      'SELECT * FROM navigation_items WHERE is_active = 1 ORDER BY sort_order ASC'
    );
    return success(res, items, 'Navigation fetched');
  } catch (err) {
    next(err);
  }
}

module.exports = { getNavigation };
