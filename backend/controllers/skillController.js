// ============================================
// Skill Controller
// ============================================
const { query } = require('../models/db');
const { success, error } = require('../utils/response');

/**
 * Get all skills grouped by category
 */
async function getSkills(req, res, next) {
  try {
    const categories = await query(
      `SELECT * FROM skill_categories ORDER BY display_order ASC`
    );

    const skills = await query(
      `SELECT id, technology_name as skill_name, category_id, proficiency, display_order as sort_order 
       FROM technologies 
       ORDER BY sort_order ASC`
    );

    // Group skills into their categories
    const grouped = categories.map(cat => ({
      ...cat,
      skills: skills.filter(s => s.category_id === cat.id),
    }));

    return success(res, grouped, 'Skills fetched');
  } catch (err) {
    next(err);
  }
}

module.exports = { getSkills };
