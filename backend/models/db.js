// ============================================
// Database Query Helper
// ============================================
const pool = require('../config/db');

/**
 * Execute a parameterized SQL query
 * @param {string} sql - SQL query with ? placeholders
 * @param {Array} params - Parameters for prepared statement
 * @returns {Promise<Array>} Query results
 */
async function query(sql, params = []) {
  const [rows] = await pool.execute(sql, params);
  return rows;
}

/**
 * Get a single row by query
 */
async function queryOne(sql, params = []) {
  const rows = await query(sql, params);
  return rows[0] || null;
}

/**
 * Insert a row and return the inserted id
 */
async function insert(sql, params = []) {
  const [result] = await pool.execute(sql, params);
  return result.insertId;
}

module.exports = { query, queryOne, insert };
