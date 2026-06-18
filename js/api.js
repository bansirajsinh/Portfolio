// ============================================
// Reusable API Client
// ============================================

const API = {
  baseURL: '/api',

  /**
   * GET request
   * @param {string} endpoint - e.g. '/profile'
   * @returns {Promise<Object>} parsed JSON response
   */
  async get(endpoint) {
    try {
      const res = await fetch(`${this.baseURL}${endpoint}`);
      const data = await res.json();
      if (!res.ok) throw new Error(data.message || 'Request failed');
      return data;
    } catch (err) {
      console.error(`API GET ${endpoint} failed:`, err.message);
      throw err;
    }
  },

  /**
   * POST request
   * @param {string} endpoint
   * @param {Object} body
   * @returns {Promise<Object>} parsed JSON response
   */
  async post(endpoint, body) {
    try {
      const res = await fetch(`${this.baseURL}${endpoint}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(body),
      });
      const data = await res.json();
      if (!res.ok) {
        const err = new Error(data.message || 'Request failed');
        err.errors = data.errors || null;
        err.status = res.status;
        throw err;
      }
      return data;
    } catch (err) {
      console.error(`API POST ${endpoint} failed:`, err.message);
      throw err;
    }
  },
};
