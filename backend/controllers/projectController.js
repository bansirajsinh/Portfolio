// ============================================
// Project Controller
// ============================================
const { query, queryOne } = require('../models/db');
const { success, notFound } = require('../utils/response');

/**
 * Get all active projects with their technologies and category
 */
async function getProjects(req, res, next) {
  try {
    const projects = await query(
      `SELECT p.*, pc.category_name, pc.category_slug
       FROM projects p
       LEFT JOIN project_categories pc ON p.category_id = pc.id
       WHERE p.is_active = 1
       ORDER BY p.featured DESC, p.sort_order ASC`
    );

    // Fetch technologies for each project
    for (const project of projects) {
      const techs = await query(
        `SELECT t.technology_name, t.technology_slug
         FROM project_technologies pt
         JOIN technologies t ON pt.technology_id = t.id
         WHERE pt.project_id = ?
         ORDER BY t.sort_order ASC`,
        [project.id]
      );
      project.technologies = techs;
    }

    return success(res, projects, 'Projects fetched');
  } catch (err) {
    next(err);
  }
}

/**
 * Get featured projects only
 */
async function getFeaturedProjects(req, res, next) {
  try {
    const projects = await query(
      `SELECT p.*, pc.category_name, pc.category_slug
       FROM projects p
       LEFT JOIN project_categories pc ON p.category_id = pc.id
       WHERE p.is_active = 1 AND p.featured = 1
       ORDER BY p.sort_order ASC`
    );

    for (const project of projects) {
      const techs = await query(
        `SELECT t.technology_name, t.technology_slug
         FROM project_technologies pt
         JOIN technologies t ON pt.technology_id = t.id
         WHERE pt.project_id = ?
         ORDER BY t.sort_order ASC`,
        [project.id]
      );
      project.technologies = techs;
    }

    return success(res, projects, 'Featured projects fetched');
  } catch (err) {
    next(err);
  }
}

/**
 * Get single project by slug with full details
 */
async function getProjectBySlug(req, res, next) {
  try {
    const { slug } = req.params;

    const project = await queryOne(
      `SELECT p.*, pc.category_name, pc.category_slug
       FROM projects p
       LEFT JOIN project_categories pc ON p.category_id = pc.id
       WHERE p.slug = ? AND p.is_active = 1`,
      [slug]
    );

    if (!project) return notFound(res, 'Project');

    // Technologies
    project.technologies = await query(
      `SELECT t.technology_name, t.technology_slug
       FROM project_technologies pt
       JOIN technologies t ON pt.technology_id = t.id
       WHERE pt.project_id = ?
       ORDER BY t.sort_order ASC`,
      [project.id]
    );

    // Images
    project.images = await query(
      `SELECT * FROM project_images
       WHERE project_id = ?
       ORDER BY sort_order ASC`,
      [project.id]
    );

    // Links
    project.links = await query(
      `SELECT * FROM project_links
       WHERE project_id = ? AND is_active = 1
       ORDER BY sort_order ASC`,
      [project.id]
    );

    return success(res, project, 'Project fetched');
  } catch (err) {
    next(err);
  }
}

module.exports = { getProjects, getFeaturedProjects, getProjectBySlug };
