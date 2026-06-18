// ============================================
// Settings Controller
// ============================================
const { query } = require('../models/db');
const { success } = require('../utils/response');

async function getSettings(req, res, next) {
  try {
    const settings = await query(
      'SELECT setting_key, setting_value, setting_type FROM site_settings WHERE is_public = 1'
    );
    // Convert to key-value object
    const settingsObj = {};
    settings.forEach(s => { settingsObj[s.setting_key] = s.setting_value; });
    return success(res, settingsObj, 'Settings fetched');
  } catch (err) {
    next(err);
  }
}

module.exports = { getSettings };
