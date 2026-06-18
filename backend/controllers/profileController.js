// ============================================
// Profile Controller
// ============================================
const { query, queryOne } = require('../models/db');
const { success, error, notFound } = require('../utils/response');

async function getProfile(req, res, next) {
  try {
    const profile = await queryOne('SELECT * FROM site_profile LIMIT 1');
    if (!profile) return notFound(res, 'Profile');
    return success(res, profile, 'Profile fetched');
  } catch (err) {
    next(err);
  }
}

module.exports = { getProfile };
